import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signal_poc/data/model/activity_model.dart';
import 'package:signal_poc/data/model/activity_parameters_model.dart';
import 'package:signal_poc/data/repository/activity_repository.dart';
import 'package:signal_poc/view/components/activity_type_dropdown.dart';
import 'package:signal_poc/view/components/loading_widget.dart';
import 'package:signal_poc/view/components/participants_dropdown.dart';
import 'package:signal_poc/view/components/result.dart';
import 'package:signals/signals_flutter.dart';

class HomePage extends StatefulWidget {
  final ActivityRepository _repository;
  const HomePage({required ActivityRepository repository, super.key})
      : _repository = repository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final activitySignal = AsyncSignal<ActivityModel?>(
    AsyncState.data(null),
  );

  final activityTypeSignal = signal<String>(
    'whatever',
  );
  final participantsSignal = signal<int>(
    1,
  );

  late final activityParameters = computed(
    () => ActivityParametersModel(
      type: activityTypeSignal.value,
      participants: participantsSignal.value,
    ),
  );

  Future<void> getActivity() async {
    activitySignal.value = AsyncState.loading();
    final activity = await widget._repository.fetchActivity(
      activityParametersModel: activityParameters.value,
    );
    if (activity == null) {
      activitySignal.value = AsyncState.error('Sorry, something went wrong');
    } else {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      activitySignal.value = AsyncState.data(activity);
    }
  }

  @override
  void initState() {
    effect(() => log('Activity parameters changed: $activityParameters'));
    super.initState();
  }

  void reset() {
    activitySignal.value = AsyncState.data(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const Text(
        'By Caio Zubek - Thanks for passing by :> ',
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          'Get Active!',
          style: TextStyle(fontFamily: GoogleFonts.varelaRound().fontFamily),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Watch.builder(
          builder: (context) {
            if (activitySignal.value.hasError) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      activitySignal.value.error.toString(),
                    ),
                    TextButton(
                      onPressed: reset,
                      child: const Text(' Please try again'),
                    )
                  ],
                ),
              );
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: activitySignal.value.isLoading
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : activitySignal.value.value == null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 128.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Watch.builder(
                                      builder: (context) =>
                                          ActivityTypeDropdown(
                                        value: activityTypeSignal.value,
                                        onChangeActivityType: (activityType) =>
                                            activityTypeSignal.value =
                                                activityType!,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Watch.builder(
                                      builder: (context) =>
                                          ParticipantsDropdown(
                                        value: participantsSignal.value,
                                        onChangeActivityParticipants:
                                            (participants) => participantsSignal
                                                .value = participants!,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: getActivity,
                                  child: const Text('Go!'),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: ResultPage(
                              activityModel: activitySignal.value.value!,
                              onTryAgain: reset),
                        ),
            );
          },
        ),
      ),
    );
  }
}

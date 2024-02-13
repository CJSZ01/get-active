import 'package:flutter/material.dart';
import 'package:signal_poc/colors.dart';
import 'package:signal_poc/constants.dart';
import 'package:signal_poc/extensions.dart';
import 'package:signal_poc/typedefs.dart';

class ParticipantsDropdown extends StatelessWidget {
  const ParticipantsDropdown({
    super.key,
    required this.onChangeActivityParticipants,
    required this.value,
  });

  final int value;
  final OnChangeActivityParticipants onChangeActivityParticipants;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('for... '),
          DropdownButton<int>(
              value: value,
              items: Constants.participants
                  .map(
                    (number) => DropdownMenuItem<int>(
                      value: number,
                      child: Text(
                        number.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChangeActivityParticipants),
          Text(
            value.getPlural(),
          ),
        ],
      ),
    );
  }
}

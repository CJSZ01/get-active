import 'package:flutter/material.dart';
import 'package:signal_poc/colors.dart';

import 'package:signal_poc/data/model/activity_model.dart';
import 'package:signal_poc/extensions.dart';

class ResultPage extends StatelessWidget {
  final ActivityModel activityModel;
  final VoidCallback onTryAgain;
  const ResultPage({
    Key? key,
    required this.activityModel,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.mint,
                        ),
                        text: 'How about you...',
                        children: [
                          TextSpan(
                            text: activityModel.activity,
                            style: TextStyle(
                              color: AppColors.mint,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              style: TextStyle(
                                color: AppColors.mint,
                              ),
                              text: '?'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.mint,
                        ),
                        text: r"That's a ",
                        children: [
                          TextSpan(
                            text: activityModel.type,
                            style: TextStyle(
                              color: AppColors.mint,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              style: TextStyle(
                                color: AppColors.mint,
                              ),
                              text: ' kind of activity, for '),
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.mint,
                            ),
                            text:
                                '${activityModel.participants.toString()} ${activityModel.participants.getPlural()}!',
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onTryAgain,
          child: const Text('Go for another!'),
        ),
      ],
    );
  }
}

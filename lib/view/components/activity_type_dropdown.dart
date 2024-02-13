import 'package:flutter/material.dart';
import 'package:signal_poc/colors.dart';
import 'package:signal_poc/constants.dart';
import 'package:signal_poc/typedefs.dart';

class ActivityTypeDropdown extends StatelessWidget {
  final String value;
  final OnChangeActivityType onChangeActivityType;
  const ActivityTypeDropdown(
      {super.key, required this.value, required this.onChangeActivityType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Find me a... '),
          DropdownButton<String>(
              value: value,
              items: Constants.activityTypes
                  .map(
                    (type) => DropdownMenuItem<String>(
                      value: type,
                      child: Text(
                        type,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChangeActivityType),
          const Text(' kind of activity, '),
        ],
      ),
    );
  }
}

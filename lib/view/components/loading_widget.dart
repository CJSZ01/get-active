import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          height: 300,
          'assets/lottie/thinking.json',
        ),
        const Text(
          r"Let's see...",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(height: 4),
        CustomText(
          text: "What are you sending?",
          fontSize: 15,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
        )
      ],
    );
  }
}

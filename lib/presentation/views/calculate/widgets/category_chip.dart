import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(label);
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 0.7),
          color: active
              ? Theme.of(context).colorScheme.tertiary
              : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (active) ...{
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColorLight,
                size: 16,
              ),
              const SizedBox(width: 4),
            },
            CustomText(
              text: label,
              color: active
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).colorScheme.tertiary,
            )
          ],
        ),
      ),
    );
  }
}

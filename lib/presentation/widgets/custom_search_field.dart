import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/custom_text_field.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
    this.onTap,
    this.focusNode,
  });

  final TextEditingController? controller;
  final VoidCallback? onTap;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CustomTextField(
        controller: controller,
        focusNode: focusNode,
        onTap: onTap,
        hint: "Enter the receipt number...",
        fillColor: Theme.of(context).primaryColorLight,
        borderRadius: 30,
        prefix: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        suffix: Padding(
          padding: const EdgeInsets.only(right: 6),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            radius: 20,
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.flip,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

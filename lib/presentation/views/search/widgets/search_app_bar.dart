import 'package:flutter/material.dart';
import 'package:movemate/presentation/widgets/custom_search_field.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Row(
          children: [
            BackButton(color: Theme.of(context).primaryColorLight),
            Expanded(
              child: Hero(
                tag: const ValueKey("search"),
                child: Material(
                  color: Colors.transparent,
                  child: CustomSearchField(
                    focusNode: focusNode,
                    controller: controller,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}

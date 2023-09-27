import 'package:flutter/material.dart';
import 'package:movemate/presentation/resources/assets.dart';
import 'package:movemate/presentation/views/search/search_view.dart';
import 'package:movemate/presentation/widgets/custom_search_field.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const _UserInfoWithNotificationRow(),
            const SizedBox(height: 24),
            Hero(
              tag: const ValueKey("search"),
              child: Material(
                color: Colors.transparent,
                child: CustomSearchField(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SearchView(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 152);
}

class _UserInfoWithNotificationRow extends StatelessWidget {
  const _UserInfoWithNotificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 24,
          backgroundImage: AppAssets.avatar,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.near_me,
                  color: Theme.of(context).primaryColorLight.withOpacity(.55),
                  size: 18,
                ),
                const SizedBox(width: 2),
                CustomText(
                  text: "Your location",
                  color: Theme.of(context).primaryColorLight.withOpacity(.55),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Wertheimer, Illinois",
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.expand_more,
                  color: Theme.of(context).primaryColorLight,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).primaryColorLight,
          child: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

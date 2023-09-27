import 'package:flutter/material.dart';

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 8),
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(width: 8),
        Container(
          height: 20,
          width: 1.2,
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}

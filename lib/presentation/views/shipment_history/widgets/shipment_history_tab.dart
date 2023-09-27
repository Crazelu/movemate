import 'package:flutter/material.dart';
import 'package:movemate/presentation/theme/shipment_history_tab_theme.dart';
import 'package:movemate/presentation/widgets/custom_text.dart';

class ShipmentHistoryTab extends Tab {
  ShipmentHistoryTab({
    super.key,
    required String label,
    required int count,
    required bool selected,
    required ShipmentHistoryTabTheme theme,
  }) : super(
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: label),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: selected ? theme.selectedColor : theme.unselectedColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomText(
                  text: "$count",
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
}

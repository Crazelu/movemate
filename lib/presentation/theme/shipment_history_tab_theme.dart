import 'package:flutter/material.dart';

class ShipmentHistoryTabTheme extends ThemeExtension<ShipmentHistoryTabTheme> {
  Color get selectedColor => const Color(0xfff38527);
  Color get unselectedColor => const Color(0xff7358c4);
  @override
  ThemeExtension<ShipmentHistoryTabTheme> copyWith() => this;

  @override
  ThemeExtension<ShipmentHistoryTabTheme> lerp(
    covariant ThemeExtension<ShipmentHistoryTabTheme>? other,
    double t,
  ) =>
      this;
}

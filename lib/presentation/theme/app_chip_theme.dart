import 'package:flutter/material.dart';

class AppChipTheme extends ThemeExtension<AppChipTheme> {
  Color get selectedChipColor => const Color(0xff152335);
  Color get selectedChipForegroundColor => const Color(0xffe2e7ea);
  Color get unselectedChipColor => Colors.transparent;
  Color get unselectedChipForegroundColor => const Color(0xff454854);
  Color get borderColor => const Color(0xff152335);
  double get borderWidth => 0.7;
  BorderRadiusGeometry get borderRadius => BorderRadius.circular(12);

  @override
  ThemeExtension<AppChipTheme> copyWith() => this;

  @override
  ThemeExtension<AppChipTheme> lerp(
    covariant ThemeExtension<AppChipTheme>? other,
    double t,
  ) =>
      this;
}

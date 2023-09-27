import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movemate/presentation/theme/app_chip_theme.dart';
import 'package:movemate/presentation/theme/shipment_history_tab_theme.dart';
import 'package:movemate/presentation/views/index/index_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Movemate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        primarySwatch: Colors.deepPurple,
        primaryColorLight: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xff493391),
          background: Color(0xfff9f9f9),
          onBackground: Color(0xff192332),
          secondary: Color(0xfff38527),
          onSecondary: Color(0xfff2f9f3),
          primaryContainer: Color(0xffffffff),
          onPrimaryContainer: Color(0xffa8a8aa),
          tertiary: Color(0xff152335),
        ),
        textTheme: GoogleFonts.ptSansTextTheme(textTheme),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xfff38527)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        extensions: {
          AppChipTheme(),
          ShipmentHistoryTabTheme(),
        },
      ),
      home: const IndexView(),
    );
  }
}

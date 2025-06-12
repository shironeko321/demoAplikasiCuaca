import 'package:flutter/material.dart';

final Color primaryBlueNight = Color(0xFF000F2A); // lebih gelap dari 0xFF001F54

final ThemeData materialYouBlueNightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryBlueNight, brightness: Brightness.light),

  // AppBar tanpa shadow, warna utama biru malam, teks putih
  appBarTheme: AppBarTheme(
    backgroundColor: primaryBlueNight,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    actionsIconTheme: IconThemeData(color: Colors.white),
  ),

  // ElevatedButton flat tanpa shadow
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryBlueNight,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),

  // TextButton warna teks biru malam
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryBlueNight,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),

  // OutlinedButton border biru malam dan teks biru malam
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryBlueNight,
      side: BorderSide(color: primaryBlueNight, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),

  // FloatingActionButton warna biru malam, tanpa shadow
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryBlueNight,
    elevation: 0,
    foregroundColor: Colors.white,
  ),

  // Card tanpa shadow
  cardTheme: CardThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  // Input form flat dengan fill color ringan
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.blueGrey[50],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: primaryBlueNight),
    ),
    labelStyle: TextStyle(color: primaryBlueNight),
  ),

  // Text theme default
  textTheme: Typography.material2021().white.apply(fontFamily: 'Roboto'),
);

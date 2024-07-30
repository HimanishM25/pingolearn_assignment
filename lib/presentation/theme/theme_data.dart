import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData light_theme=ThemeData(
appBarTheme:  AppBarTheme(
titleTextStyle: GoogleFonts.poppins(
fontSize: 20.0,
fontWeight: FontWeight.bold,
  color: Colors.white,
),
color: Color(0xff0C54BE),
foregroundColor: Colors.white,
//backgroundColor: Color(0xff0C54BE),
),
scaffoldBackgroundColor: Color(0xffF5F9FD),
textTheme: TextTheme(
bodyMedium: GoogleFonts.poppins(color:Color(0xff303F60),fontSize: 14.0, fontWeight: FontWeight.w500),
),
colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0C54BE)),
useMaterial3: true,
);

ThemeData dark_theme=ThemeData(
  appBarTheme:  AppBarTheme(
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    color: Color(0xff0C54BE),
    foregroundColor: Colors.white,
    //backgroundColor: Color(0xff0C54BE),
  ),
  scaffoldBackgroundColor: Color(0xffF5F9FD),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(color:Color(0xff303F60),fontSize: 14.0, fontWeight: FontWeight.w500),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0C54BE)),
  useMaterial3: true,
);
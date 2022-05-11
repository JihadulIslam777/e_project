import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OursProjectTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline4: GoogleFonts.roboto(
      fontSize: 34,
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 20,
      color: Colors.black87,
      fontWeight: FontWeight.w800,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      color: Colors.black87,
      fontWeight: FontWeight.w700,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 16,
      color: Colors.black87,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    ),
    button: GoogleFonts.roboto(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    caption: GoogleFonts.roboto(
      fontSize: 12,
      color: Colors.black,
    ),
  );
}

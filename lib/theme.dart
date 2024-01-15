import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 206, 206, 206),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 93, 0, 206),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.vt323(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 7,
          color: const Color.fromARGB(255, 214, 180, 255),
        ),
      ),
      titleMedium: GoogleFonts.vt323(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 12,
        ),
      ),
      titleSmall: GoogleFonts.vt323(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      displayLarge: GoogleFonts.vt323(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 12,
          color: const Color.fromARGB(255, 93, 0, 206),
          fontWeight: FontWeight.bold,
        ),
      ),
      displayMedium: GoogleFonts.vt323(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 13,
          color: const Color.fromARGB(255, 214, 180, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(8.0)),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromARGB(255, 93, 0, 206)),
        shadowColor: const MaterialStatePropertyAll(Colors.black),
        elevation: const MaterialStatePropertyAll(10),
        minimumSize: MaterialStatePropertyAll(
          Size(
            MediaQuery.of(context).size.width / 2,
            MediaQuery.of(context).size.height / 13,
          ),
        ),
        side: const MaterialStatePropertyAll(
          BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          GoogleFonts.vt323(
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 10,
            ),
          ),
        ),
      ),
    ),
  );
}

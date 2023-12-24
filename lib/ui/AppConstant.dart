import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textFancyheader = GoogleFonts.sourceSerif4(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: const Color.fromARGB(255, 228, 239, 16));

  static TextStyle textError = TextStyle(
    color: Colors.red[300],
    fontSize: 20,
  );

  static TextStyle textLink =
      const TextStyle(color: Color.fromARGB(255, 40, 255, 44));
  static TextStyle textLinkDark =
      const TextStyle(color: Color.fromARGB(255, 216, 222, 227));

  static TextStyle textBody =
      const TextStyle(color: Color.fromARGB(255, 40, 255, 76), fontSize: 20);
  static TextStyle textBodyFocus =
      const TextStyle(color: Color.fromARGB(255, 216, 222, 227), fontSize: 18);

  static Color mainColor = Color.fromARGB(255, 71, 160, 248);
  static Color secondaryColor = Color.fromARGB(255, 238, 239, 239);
  static Color thirdColor = Color.fromARGB(255, 26, 250, 22);

  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      print('--- Loi ---');
      return false;
    }
  }
}

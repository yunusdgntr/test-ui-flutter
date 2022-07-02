import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialText {
  TextStyle getMainHeader(
      double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.lato(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getInputTitleHeader(
      double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.teko(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getDidact(double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.didactGothic(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getBuble(double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.bubblegumSans(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getRoboto(double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.roboto(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getRubik(double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.rubik(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  TextStyle getKanik(double? fontSize, FontWeight? fontWeight, Color? color) {
    return GoogleFonts.kanit(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}

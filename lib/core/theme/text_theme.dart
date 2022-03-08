import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_todo_manabie/core/values/app_font_weight.dart';

class AppTextTheme{
  static final TextTheme mainTextTheme = TextTheme(
    ///appbar title
    headline3: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 60.0),
    headline5: GoogleFonts.notoSans(fontWeight: AppFontWeight.bold, fontSize: 24.0),
    headline6: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 21.0),
    caption: GoogleFonts.notoSans(fontWeight: AppFontWeight.semiBold, fontSize: 14.0),
    subtitle1: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 15.0),
    overline: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 13.0),
    bodyText1: GoogleFonts.notoSans(fontWeight: AppFontWeight.regular, fontSize: 17.0),
    subtitle2: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 13.0),
    bodyText2: GoogleFonts.notoSans(fontWeight: AppFontWeight.regular, fontSize: 14.0),
    button: GoogleFonts.notoSans(fontWeight: AppFontWeight.medium, fontSize: 17.0),
  );
}

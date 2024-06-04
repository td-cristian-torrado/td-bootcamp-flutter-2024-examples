import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

ThemeData getFabCustomTheme({required BuildContext context}){
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    return Theme.of(context)
            .copyWith(colorScheme: Theme.of(context)
              .colorScheme.copyWith(
                primaryContainer: brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF252525),
                onPrimaryContainer: brightness == Brightness.dark ? const Color(0xFFFFFFFF) : const Color(0xFF252525)));
  }
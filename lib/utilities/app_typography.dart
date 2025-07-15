import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTypography {
  static const TextStyle labelTextMedium = TextStyle(
    fontFamily: 'San Fransisco',
    fontSize: 18.0,
    letterSpacing: 2.0,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static const TextStyle hintTextStyle = TextStyle(
    fontFamily: 'San Fransisco',
    fontSize: 15.0,
    letterSpacing: 2.0,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle labelTextLarge = TextStyle(
    fontFamily: 'San Fransisco',
    fontSize: 50.0,
    letterSpacing: 1.0,
    fontWeight: FontWeight.w900,
  );
}

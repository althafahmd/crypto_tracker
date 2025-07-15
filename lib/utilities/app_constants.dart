import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract class AppConstants {
  static const InputDecoration inputFieldStyle = InputDecoration(
    filled: true,
    fillColor: AppColors.cardColor,
    contentPadding: EdgeInsets.all(16.0),
    hintText: 'Location',
    hintStyle: AppTypography.hintTextStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100.0)),
      borderSide: BorderSide(style: BorderStyle.none, width: 0),
    ),
  );
}

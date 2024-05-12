import'package:flutter/material.dart';

import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get accent => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  static BoxDecoration get surface => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );

  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SFProDisplay',
    );
  }
}

class CustomTextStyles {
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
      );

  static get bodyLargeBlack900_2 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.56),
      );

  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get headlineMediumPrimary => theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.6),
        fontWeight: FontWeight.w400,
      );

  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
}

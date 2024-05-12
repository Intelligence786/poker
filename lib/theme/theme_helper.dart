import 'package:flutter/material.dart';

import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

///  Helper  class  for  managing  themes  and  colors.
//  ignore_for_file:  must_be_immutable
class ThemeHelper {
  //  The  current  app  theme
  var _appTheme = PrefUtils().getThemeData();

//  A  map  of  custom  color  themes  supported  by  the  app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

//  A  map  of  color  schemes  supported  by  the  app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  ///  Returns  the  lightCode  colors  for  the  current  theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ///  Returns  the  current  theme  data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  ///  Returns  the  lightCode  colors  for  the  current  theme.
  LightCodeColors themeColor() => _getThemeColors();

  ///  Returns  the  current  theme  data.
  ThemeData themeData() => _getThemeData();
}

///  Class  containing  the  supported  text  theme  styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.49),
          fontSize: 18.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.56),
          fontSize: 14.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 28.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 17.fSize,
          fontFamily: 'SF  Pro  Display',
          fontWeight: FontWeight.w600,
        ),
      );
}

///  Class  containing  the  supported  color  schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF6E16B3),
    secondaryContainer: Color(0X0A6E16B4),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0X142F2F2F),
  );
}

///  Class  containing  custom  colors  for  a  lightCode  theme.
class LightCodeColors {
  //  Black
  Color get black900 => Color(0XFF000000);

//  BlueGray
  Color get blueGray400 => Color(0XFF888888);
}

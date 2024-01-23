import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ThemeHelper {
  final _appTheme = "primary";

  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer.withOpacity(1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          shadowColor: colorScheme.primary,
          elevation: 10,
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
            color: appTheme.blue50,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blue50,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodySmall: TextStyle(
          color: appTheme.blueGray300,
          fontSize: 12.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 24.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: appTheme.pink300,
          fontSize: 10.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 20.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3DFFFFFF),
    secondaryContainer: Color(0XFF53D1B6),

    // On colors(text colors)
    onPrimary: Color(0X87223263),
    onPrimaryContainer: Color(0X87FFFFFF),
  );
}

class PrimaryColors {
  // Amber
  Color get amber500 => const Color(0XFFFFC107);

  // Blue
  Color get blue50 => const Color(0XFFFFFFFF);

  Color get blueA200 => const Color(0XFFFFFFFF);

  // BlueGray
  Color get blueGray300 => const Color(0XFF9098B1);

  // Gray
  Color get gray400 => const Color(0XFF171717);

  // Indigo
  Color get indigoA200 => const Color(0XFF5B61F4);

  // LightBlue
  Color get lightBlue600 => const Color(0XFF039BE5);

  // Pink
  Color get pink300 => const Color(0XFFFB7181);

  // Yellow
  Color get yellow700 => const Color(0XFFFFC732);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

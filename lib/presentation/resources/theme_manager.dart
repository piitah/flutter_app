import 'package:cleanarchitecture/presentation/resources/styles_manager.dart';
import "package:flutter/material.dart";

import 'color_manager.dart';
import 'font_manager.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of ThemeData
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkgrey,
    disabledColor: ColorManager.grey1,
    // ripplecolor
    // splashColor: ColorManager.primaryOpacity70,
    // accentColor: ColorManager.grey,

    // Card view theme
    cardTheme: CardTheme(color: ColorManager.white, shadowColor: ColorManager.grey, elevation: AppSize.s4),

    //  App Bar Theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        // shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),

    // Button Theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      // splashColor: ColorManager.primaryOpacity70
    ),

    // Elevatied Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(textStyle: getRegularStyle(color: ColorManager.white), primary: ColorManager.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)))),

    // TextTheme
    textTheme: TextTheme(headline1: getSemiBoldStyle(color: ColorManager.darkgrey, fontSize: FontSize.s16), subtitle1: getMediumStyle(color: ColorManager.lightgrey, fontSize: FontSize.s14), caption: getRegularStyle(color: ColorManager.grey1), bodyText1: getRegularStyle(color: ColorManager.grey)),

    // Form Theme Data
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkgrey),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // Enabled  Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s4)),
      ),

      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // Error Border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // FOcusederror Border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}

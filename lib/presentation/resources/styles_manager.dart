import "package:flutter/material.dart";

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);
}

// regular style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// light
TextStyle getLightStyle({double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

//  medium
TextStyle getMediumStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// Bold
TextStyle getBoldStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// Semi-Bold
TextStyle getSemiBoldStyle({double fontSize = FontSize.s18, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semibold, color);
}

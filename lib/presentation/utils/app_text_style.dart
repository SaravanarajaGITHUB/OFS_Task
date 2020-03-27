import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ofs_task/presentation/utils/app_font.dart';

//default style
TextStyle getStyleButton(context) => Theme.of(context).textTheme.button;

TextStyle getStyleOverLine(context) => Theme.of(context).textTheme.overline;

TextStyle getStyleCaption(context) => Theme.of(context).textTheme.caption;

TextStyle getStyleBody1(context) => Theme.of(context).textTheme.body1;

TextStyle getStyleBody2(context) => Theme.of(context).textTheme.body2;

TextStyle getStyleSubHeading(context) => Theme.of(context).textTheme.subhead;

TextStyle getStyleSubTitle(context) => Theme.of(context).textTheme.subtitle;

TextStyle getStyleTitle(context) => Theme.of(context).textTheme.title;

TextStyle getStyleHeading(context) => Theme.of(context).textTheme.headline;

TextStyle getStyleDisplay1(context) => Theme.of(context).textTheme.display1;

TextStyle getStyleDisplay2(context) => Theme.of(context).textTheme.display2;

TextStyle getStyleDisplay3(context) => Theme.of(context).textTheme.display3;

//style : app button text style
TextStyle getStyleButtonText(context) =>
    getStyleSubHeading(context).copyWith(
        color: Colors.white, fontWeight: AppFont.fontWeightSemiBold);
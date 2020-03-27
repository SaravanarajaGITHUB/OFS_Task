import 'package:flutter/material.dart';
import 'package:ofs_task/presentation/utils/app_font.dart';

class WidgetUtil {
  static AppBar buildAppBar(BuildContext buildContext, String title) {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title.toUpperCase(),
        style: Theme.of(buildContext)
            .textTheme
            .subhead
            .copyWith(color: Colors.white, fontWeight: AppFont.fontWeightBold),
      ),
      elevation: 4.0,
    );
  }
}

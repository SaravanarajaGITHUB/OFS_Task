import 'package:flutter/material.dart';
import 'package:ofs_task/presentation/helper/router.dart';
import 'package:ofs_task/presentation/utils/app_colors.dart';
import 'package:ofs_task/presentation/utils/app_font.dart';
import 'package:ofs_task/presentation/utils/presentation_constants.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PresentationConstants.APP_NAME,
      theme: ThemeData(
        fontFamily: AppFont.fontFamilyName,
        textTheme: TextTheme(
          button: TextStyle(fontWeight: AppFont.fontWeightRegular),
          caption: TextStyle(fontWeight: AppFont.fontWeightRegular),
          body1: TextStyle(fontWeight: AppFont.fontWeightRegular),
          body2: TextStyle(fontWeight: AppFont.fontWeightRegular),
          subhead: TextStyle(fontWeight: AppFont.fontWeightRegular),
          title: TextStyle(fontWeight: AppFont.fontWeightRegular),
          headline: TextStyle(fontWeight: AppFont.fontWeightRegular),
          display1: TextStyle(fontWeight: AppFont.fontWeightRegular),
          display2: TextStyle(fontWeight: AppFont.fontWeightRegular),
          display3: TextStyle(fontWeight: AppFont.fontWeightRegular),
          display4: TextStyle(fontWeight: AppFont.fontWeightRegular),
          overline: TextStyle(fontWeight: AppFont.fontWeightRegular),
          subtitle: TextStyle(fontWeight: AppFont.fontWeightRegular),
        ),
        buttonTheme: ButtonThemeData(buttonColor: AppColors.GREEN),
        scaffoldBackgroundColor: AppColors.LIGHT_GREY,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            brightness: Brightness.dark,
            elevation: 4.0),
        primaryColor: AppColors.GREEN,
        accentColor: AppColors.GREEN,
        buttonColor: AppColors.GREEN,
        primaryColorBrightness: Brightness.light,
        accentColorBrightness: Brightness.light,
        brightness: Brightness.light,
        cursorColor: AppColors.GREEN,
        dialogBackgroundColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.initialRoute,
    );
  }
}

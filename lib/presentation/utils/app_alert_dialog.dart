import 'package:flutter/material.dart';
import 'package:ofs_task/presentation/utils/app_colors.dart';
import 'package:ofs_task/presentation/utils/app_font.dart';
import 'package:ofs_task/presentation/utils/app_text_style.dart';

class AppAlertDialog {
  static void showAlertDialog(
      {@required BuildContext context,
      @required String message,
      String title = 'Alert',
      String positiveTitle = 'OK',
      VoidCallback onPressed}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                title,
                style: getStyleTitle(context).copyWith(
                    color: Colors.black, fontWeight: AppFont.fontWeightBold),
              ),
              content: Text(
                message,
                style: getStyleSubHeading(context).copyWith(
                    color: Colors.black, fontWeight: AppFont.fontWeightRegular),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onPressed != null) onPressed();
                    },
                    child: Text(
                      positiveTitle,
                      style: getStyleSubHeading(context).copyWith(
                          color: AppColors.GREEN,
                          fontWeight: AppFont.fontWeightBold),
                    ))
              ],
            ));
  }
}

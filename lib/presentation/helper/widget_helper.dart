import 'package:flutter/material.dart';
import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/presentation/utils/app_alert_dialog.dart';
import 'package:ofs_task/presentation/utils/app_font.dart';

mixin WidgetHelper on StatelessWidget {
  Widget buildAppBar(String title) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              color: Colors.white, fontWeight: AppFont.fontWeightBold)),
    );
  }

  Widget showError(BuildContext context, Response response) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (response != null && Status.FAILURE == response.status) {
        AppAlertDialog.showAlertDialog(
            context: context,
            message: response.message,
            onPressed: () {
              Navigator.pop(context);
            });
      }
    });
    return SizedBox();
  }

  bool getResponseStatus(Response response) {
    return response != null && Status.SUCCESS == response.status;
  }
}

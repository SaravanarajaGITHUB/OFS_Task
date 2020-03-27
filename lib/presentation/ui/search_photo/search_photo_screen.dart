import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ofs_task/presentation/helper/widget_helper.dart';
import 'package:ofs_task/presentation/ui/search_photo/search_photo_view_model.dart';
import 'package:ofs_task/presentation/ui/search_photo_result/search_photo_result_screen.dart';
import 'package:ofs_task/presentation/utils/app_text_style.dart';
import 'package:ofs_task/presentation/utils/presentation_constants.dart';
import 'package:ofs_task/presentation/view_model/base_view.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';
import 'package:ofs_task/presentation/widget/app_circular_progress_indicator.dart';
import 'package:ofs_task/presentation/widget/outline_text_field.dart';

class SearchPhotoScreen extends StatelessWidget with WidgetHelper {
  static const ROUTE_NAME = '/';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchPhotoViewModel>(
      builder: (buildContext, viewModel, widget) => ModalProgressHUD(
        inAsyncCall: ViewState.Busy == viewModel.state,
        progressIndicator: AppCircularProgressIndicator(),
        child: Scaffold(
            key: this._scaffoldKey,
            appBar: buildAppBar(PresentationConstants.APP_NAME),
            body: this._buildBody(context, viewModel)),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SearchPhotoViewModel viewModel) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this._buildSearchTextField(),
          this._buildButtonLoginWidget(context, viewModel)
        ],
      ),
    );
  }

  Widget _buildSearchTextField() {
    return OutlineTextField(
        hint: PresentationConstants.SEARCH_HINT,
        keyboardType: TextInputType.text,
        textEditingController: this._searchTextEditController);
  }

  Widget _buildButtonLoginWidget(
      BuildContext context, SearchPhotoViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 12.0),
        child: Text(
          PresentationConstants.SEARCH,
          style: getStyleButtonText(context),
        ),
        onPressed: () => _onClickSearchButtonClick(context, viewModel),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  void _onClickSearchButtonClick(
      BuildContext context, SearchPhotoViewModel viewModel) async {
    FocusScope.of(context).unfocus();
    if (this._searchTextEditController.text.isNotEmpty) {
      await viewModel.getSearchPhotoStatus(this._searchTextEditController.text);
      showError(context, viewModel.searchStatus);
      if (getResponseStatus(viewModel.searchStatus) &&
          viewModel.searchStatus.data) {
        Navigator.pushNamed(context, PhotoResultScreen.ROUTE_NAME,
            arguments: this._searchTextEditController.text);
      }
    } else {
      final snackBar =
          SnackBar(content: Text(PresentationConstants.ALERT_MESSAGE_KEYWORD));
      this._scaffoldKey.currentState.hideCurrentSnackBar();
      this._scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}

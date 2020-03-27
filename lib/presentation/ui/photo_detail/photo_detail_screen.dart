import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/presentation/helper/widget_helper.dart';
import 'package:ofs_task/presentation/model/photo_detail_model.dart';
import 'package:ofs_task/presentation/ui/photo_detail/photo_detail_view_model.dart';
import 'package:ofs_task/presentation/utils/app_text_style.dart';
import 'package:ofs_task/presentation/utils/presentation_constants.dart';
import 'package:ofs_task/presentation/view_model/base_view.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';
import 'package:ofs_task/presentation/widget/app_circular_progress_indicator.dart';

class PhotoDetailScreen extends StatelessWidget with WidgetHelper {
  static const ROUTE_NAME = '/photo_detail';

  final String _photoId;

  PhotoDetailScreen({@required String photoId}) : this._photoId = photoId;

  @override
  Widget build(BuildContext context) {
    return BaseView<PhotoDetailViewModel>(
      onModelReady: (model) => model.getPhotoDetail(_photoId),
      builder: (buildContext, viewModel, _) => ModalProgressHUD(
        inAsyncCall: ViewState.Busy == viewModel.state,
        progressIndicator: AppCircularProgressIndicator(),
        child: Scaffold(
          appBar: buildAppBar(PresentationConstants.PHOTO_DETAIL_TITLE),
          body: this._buildBody(context, viewModel.photoDetailModel),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, Response<PhotoDetailModel> response) {
    return getResponseStatus(response)
        ? this._buildContent(context, response.data)
        : showError(context, response);
  }

  Widget _buildContent(
      BuildContext context, PhotoDetailModel photoDetailModel) {
    return Container(
      margin: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this._buildImage(photoDetailModel.url),
          this._buildTitle(context, photoDetailModel.title)
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    return CachedNetworkImage(
      width: 180.0,
      height: 180.0,
      imageUrl: url,
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: getStyleSubHeading(context),
        ));
  }
}

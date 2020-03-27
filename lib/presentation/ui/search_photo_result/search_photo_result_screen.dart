import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/presentation/helper/widget_helper.dart';
import 'package:ofs_task/presentation/model/photo_model.dart';
import 'package:ofs_task/presentation/ui/photo_detail/photo_detail_screen.dart';
import 'package:ofs_task/presentation/ui/search_photo_result/search_photo_result_view_model.dart';
import 'package:ofs_task/presentation/utils/presentation_constants.dart';
import 'package:ofs_task/presentation/view_model/base_view.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';
import 'package:ofs_task/presentation/widget/app_circular_progress_indicator.dart';
import 'package:ofs_task/presentation/widget/photo_item.dart';
import 'package:sprintf/sprintf.dart';

class PhotoResultScreen extends StatelessWidget with WidgetHelper {
  static const ROUTE_NAME = '/photo_result';
  final String _keyword;

  PhotoResultScreen({@required String keyword}) : this._keyword = keyword;

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchPhotoResultViewModel>(
      onModelReady: (viewModel) => viewModel.getPhotos(),
      builder: (buildContext, viewModel, _) => ModalProgressHUD(
        inAsyncCall: ViewState.Busy == viewModel.state,
        progressIndicator: AppCircularProgressIndicator(),
        child: Scaffold(
            appBar: this._buildAppBar(),
            body: this._buildBody(context, viewModel.photosResponse)),
      ),
    );
  }

  Widget _buildAppBar() {
    return buildAppBar(
        sprintf(PresentationConstants.SEARCH_RESULT_TITLE, [this._keyword]));
  }

  Widget _buildBody(BuildContext context, Response<List<PhotoModel>> response) {
    return getResponseStatus(response)
        ? this._buildGrid(context, response.data)
        : showError(context, response);
  }

  Widget _buildGrid(BuildContext context, List<PhotoModel> photos) {
    return GridView.builder(
        itemCount: photos.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (buildContext, index) => PhotoItem(
              imageUrl: photos[index].url,
              onTap: () {
                Navigator.pushNamed(context, PhotoDetailScreen.ROUTE_NAME,
                    arguments: photos[index].id);
              },
            ));
  }
}

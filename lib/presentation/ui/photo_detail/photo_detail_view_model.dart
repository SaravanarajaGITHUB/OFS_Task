import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case.dart';
import 'package:ofs_task/presentation/model/photo_detail_model.dart';
import 'package:ofs_task/presentation/view_model/base_view_model.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';

class PhotoDetailViewModel extends BaseViewModel {
  final GetPhotoUseCase _getPhotoUseCase;
  Response<PhotoDetailModel> _photoDetailModel;

  PhotoDetailViewModel(this._getPhotoUseCase);

  Future getPhotoDetail(String id) async {
    setState(ViewState.Busy);
    this._photoDetailModel = await this._getPhotoUseCase.getPhoto(id);
    setState(ViewState.Idle);
  }

  Response<PhotoDetailModel> get photoDetailModel => this._photoDetailModel;
}

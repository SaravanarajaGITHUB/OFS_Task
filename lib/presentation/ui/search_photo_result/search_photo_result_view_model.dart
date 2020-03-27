import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case.dart';
import 'package:ofs_task/presentation/model/photo_model.dart';
import 'package:ofs_task/presentation/view_model/base_view_model.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';

class SearchPhotoResultViewModel extends BaseViewModel {
  final GetPhotosUseCase _getPhotosUseCase;
  Response<List<PhotoModel>> _photosResponse;

  SearchPhotoResultViewModel(this._getPhotosUseCase);

  Future getPhotos() async {
    setState(ViewState.Busy);
    this._photosResponse = await this._getPhotosUseCase.getPhotos();
    setState(ViewState.Idle);
  }

  Response<List<PhotoModel>> get photosResponse => this._photosResponse;
}

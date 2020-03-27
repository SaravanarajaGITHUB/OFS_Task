import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case.dart';
import 'package:ofs_task/presentation/view_model/base_view_model.dart';
import 'package:ofs_task/presentation/view_model/view_state.dart';

class SearchPhotoViewModel extends BaseViewModel {
  final SearchPhotoStatusUseCase _searchPhotoStatusUseCase;
  Response<bool> _searchStatus;

  SearchPhotoViewModel(this._searchPhotoStatusUseCase);

  Future getSearchPhotoStatus(String keyword) async {
    setState(ViewState.Busy);
    this._searchStatus =
        await this._searchPhotoStatusUseCase.searchPhotoStatus(keyword);
    setState(ViewState.Idle);
  }

  Response<bool> get searchStatus => _searchStatus;
}

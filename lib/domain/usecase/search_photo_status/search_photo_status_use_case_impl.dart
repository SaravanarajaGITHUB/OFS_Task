import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/repo/repository.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case.dart';

class SearchPhotoStatusUseCaseImpl implements SearchPhotoStatusUseCase {
  final Repository _repository;

  SearchPhotoStatusUseCaseImpl(this._repository);

  @override
  Future<Response<bool>> searchPhotoStatus(String keyword) {
    return this
        ._repository
        .searchPhotoStatus(keyword)
        .then((status) => Response.success(data: status))
        .catchError((e) => Response<bool>.failure(message: e.toString()));
  }
}

import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/repo/repository.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case.dart';
import 'package:ofs_task/domain/utils/domain_to_model_mapper.dart';
import 'package:ofs_task/presentation/model/photo_model.dart';

class GetPhotosUseCaseImpl implements GetPhotosUseCase {
  final Repository _repository;
  final DomainToModelMapper _domainToModelMapper;

  GetPhotosUseCaseImpl(this._repository, this._domainToModelMapper);

  @override
  Future<Response<List<PhotoModel>>> getPhotos() {
    return this
        ._repository
        .getPhotos()
        .then((photos) => Response.success(
            data: this._domainToModelMapper.transformPhotoModels(photos)))
        .catchError(
            (e) => Response<List<PhotoModel>>.failure(message: e.toString()));
  }
}

import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/repo/repository.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case.dart';
import 'package:ofs_task/domain/utils/domain_to_model_mapper.dart';
import 'package:ofs_task/presentation/model/photo_detail_model.dart';

class GetPhotoUseCaseImpl implements GetPhotoUseCase {
  final Repository _repository;
  final DomainToModelMapper _domainToModelMapper;

  GetPhotoUseCaseImpl(this._repository, this._domainToModelMapper);

  @override
  Future<Response<PhotoDetailModel>> getPhoto(String id) {
    return this
        ._repository
        .getPhoto(id)
        .then((photo) => Response.success(
            data: this._domainToModelMapper.transformPhotoDetailModel(photo)))
        .catchError((e) =>
            Response<PhotoDetailModel>.failure(message: e.toString()));
  }
}

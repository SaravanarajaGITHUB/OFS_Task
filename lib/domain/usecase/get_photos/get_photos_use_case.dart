import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/presentation/model/photo_model.dart';

abstract class GetPhotosUseCase{
  Future<Response<List<PhotoModel>>> getPhotos();
}
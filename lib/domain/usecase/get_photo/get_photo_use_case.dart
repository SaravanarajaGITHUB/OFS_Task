import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/presentation/model/photo_detail_model.dart';

abstract class GetPhotoUseCase{
  Future<Response<PhotoDetailModel>> getPhoto(String id);
}
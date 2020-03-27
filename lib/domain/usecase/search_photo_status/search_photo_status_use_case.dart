import 'package:ofs_task/domain/model/response.dart';

abstract class SearchPhotoStatusUseCase{
  Future<Response<bool>> searchPhotoStatus(String keyword);
}
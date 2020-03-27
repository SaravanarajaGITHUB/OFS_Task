import 'package:ofs_task/data/model/request/photo_request.dart';

abstract class WebService {
  Future<dynamic> getPhotos(PhotoRequest photoRequest);
}
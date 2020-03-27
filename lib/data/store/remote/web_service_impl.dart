import 'package:ofs_task/data/model/request/photo_request.dart';
import 'package:ofs_task/data/store/remote/method.dart';
import 'package:ofs_task/data/store/remote/web_service.dart';
import 'package:ofs_task/data/store/remote/web_service_helper.dart';
import 'package:ofs_task/data/utils/data_constants.dart';

class WebServiceImpl extends WebServiceHelper implements WebService {
  @override
  String get getBaseUrl => DataConstants.API_ENT_POINT;

  @override
  Future<dynamic> getPhotos(PhotoRequest photoRequest) {
    return call(path: getQueryParams(photoRequest), method: Method.GET);
  }
}

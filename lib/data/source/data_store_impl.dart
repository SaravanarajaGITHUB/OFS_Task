import 'package:ofs_task/data/model/entity/photo_entity.dart';
import 'package:ofs_task/data/model/request/photo_request.dart';
import 'package:ofs_task/data/model/response/photo.dart';
import 'package:ofs_task/data/model/response/photo_response.dart';
import 'package:ofs_task/data/source/data_store.dart';
import 'package:ofs_task/data/store/cache/cache.dart';
import 'package:ofs_task/data/store/remote/web_service.dart';

class DataStoreImpl implements DataStore {
  final WebService _webService;
  final Cache _cache;

  DataStoreImpl(this._webService, this._cache);

  @override
  Future<bool> searchPhotoStatus(String keyword) async {
    if (!this._cache.compareSearchKeyword(keyword) ||
        this._cache.getPhotos() == null) {
      final PhotoRequest photoRequest = PhotoRequest(
          pageNo: this._cache.getPageNo(keyword), searchKeyword: keyword);
      return this._webService.getPhotos(photoRequest).then((json) {
        final PhotoResponse photoResponse = PhotoResponse.fromJson(json);
        this._cache.setStatus(this._transformStatus(photoResponse.status));
        this._cache.setPhotos(this
            ._transformPhotoEntities(photoResponse.photoDetailResponse.photos));
        return this._cache.getStatus();
      }).catchError((e) {
        this._cache.resetPageNo();
        throw e;
      });
    } else {
      return this._cache.getStatus();
    }
  }

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    return this._cache.getPhotos();
  }

  @override
  Future<PhotoEntity> getPhoto(String id) async {
    return this._cache.getPhotos().firstWhere((photo) => photo.id == id);
  }

  List<PhotoEntity> _transformPhotoEntities(List<Photo> photos) {
    return photos
        .map((photo) => PhotoEntity(
            id: photo.id,
            secret: photo.secret,
            server: photo.server,
            farm: photo.farm.toString(),
            title: photo.title,
            isFamily: this._transformBoolean(photo.isFamily),
            isFriend: this._transformBoolean(photo.isFriend),
            isPublic: this._transformBoolean(photo.isPublic)))
        .toList();
  }

  bool _transformBoolean(int value) {
    return (value == null || value == 0) ? false : true;
  }

  bool _transformStatus(String value) {
    return value == 'ok' ? true : false;
  }
}

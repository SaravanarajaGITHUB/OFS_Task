import 'package:ofs_task/domain/model/photo.dart';
import 'package:ofs_task/domain/utils/domain_constants.dart';
import 'package:ofs_task/presentation/model/photo_detail_model.dart';
import 'package:ofs_task/presentation/model/photo_model.dart';
import 'package:sprintf/sprintf.dart';

class DomainToModelMapper {
  List<PhotoModel> transformPhotoModels(List<Photo> photos) {
    return photos
        .map((photo) =>
        PhotoModel(
            id: photo.id,
            url: this._transformPhotoUrl(photo)))
        .toList();
  }

  PhotoDetailModel transformPhotoDetailModel(Photo photo) {
    return PhotoDetailModel(title: photo.title, url: this._transformPhotoUrl(photo));
  }

  String _transformPhotoUrl(Photo photo) {
    return sprintf(DomainConstants.IMAGE_URL,
        [photo.farm, photo.server, photo.id, photo.secret]);
  }
}

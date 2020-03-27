import 'package:ofs_task/data/model/entity/photo_entity.dart';
import 'package:ofs_task/domain/model/photo.dart';

class DataToDomainMapper {
  List<Photo> transformPhotos(List<PhotoEntity> photoEntities) {
    return photoEntities
        .map((photoEntity) => this.transfrormPhoto(photoEntity))
        .toList();
  }

  Photo transfrormPhoto(PhotoEntity photoEntity) {
    return Photo(
        id: photoEntity.id,
        secret: photoEntity.secret,
        server: photoEntity.server,
        farm: photoEntity.farm,
        title: photoEntity.title);
  }
}

import 'package:ofs_task/data/model/entity/photo_entity.dart';

abstract class DataStore{
  Future<bool> searchPhotoStatus(String keyword);
  Future<List<PhotoEntity>> getPhotos();
  Future<PhotoEntity> getPhoto(String id);
}
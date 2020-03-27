
import 'package:ofs_task/domain/model/photo.dart';

abstract class Repository{
  Future<bool> searchPhotoStatus(String keyword);
  Future<List<Photo>> getPhotos();
  Future<Photo> getPhoto(String id);
}
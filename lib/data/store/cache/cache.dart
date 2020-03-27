import 'package:ofs_task/data/model/entity/photo_entity.dart';

abstract class Cache{
  bool compareSearchKeyword(String currentSearchKeyword);
  void setSearchKeyword(String currentSearchKeyword);
  void setPhotos(List<PhotoEntity> photoEntities);
  List<PhotoEntity> getPhotos();
  void setStatus(bool status);
  bool getStatus();
  int getPageNo(String searchKeyword);
  int resetPageNo();
  void clearPhotos();
  void clear();
}
import 'dart:core';

import 'package:ofs_task/data/model/entity/photo_entity.dart';
import 'package:ofs_task/data/store/cache/cache.dart';

class CacheImpl implements Cache {
  String _previousSearchKeyword;
  List<PhotoEntity> _photoEntities;
  int _pageNo = 0;
  bool _status;

  @override
  void clear() {
    this.clearPhotos();
  }

  @override
  void clearPhotos() {
    this._photoEntities?.clear();
  }

  @override
  bool compareSearchKeyword(String currentSearchKeyword) {
    return this._previousSearchKeyword != null &&
        this._previousSearchKeyword == currentSearchKeyword;
  }

  @override
  void setPhotos(List<PhotoEntity> photoEntities) {
    this._photoEntities = photoEntities;
  }

  @override
  void setSearchKeyword(String searchKeyword) {
    this._previousSearchKeyword = searchKeyword;
  }

  @override
  int getPageNo(String searchKeyword) {
    if(this.compareSearchKeyword(searchKeyword)) {
      this._pageNo += 1;
    }
    else{
      this._pageNo = 1;
    }
    return this._pageNo;
  }

  @override
  int resetPageNo() {
    this._pageNo -= 1;
    return this._pageNo;
  }

  @override
  List<PhotoEntity> getPhotos() {
    return this._photoEntities;
  }

  @override
  bool getStatus() {
    return this._status;
  }

  @override
  void setStatus(bool status) {
    this._status = status;
  }
}

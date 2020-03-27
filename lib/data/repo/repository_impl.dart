import 'package:ofs_task/data/source/data_store.dart';
import 'package:ofs_task/data/utils/data_to_domain_mapper.dart';
import 'package:ofs_task/domain/model/photo.dart';
import 'package:ofs_task/domain/repo/repository.dart';

class RepositoryImpl implements Repository {
  final DataStore _dataStore;
  final DataToDomainMapper _dataToDomainMapper;

  RepositoryImpl(this._dataStore, this._dataToDomainMapper);

  @override
  Future<bool> searchPhotoStatus(String keyword) {
    return this._dataStore.searchPhotoStatus(keyword);
  }

  @override
  Future<List<Photo>> getPhotos() {
    return this._dataStore.getPhotos().then((photoEntities) =>
        this._dataToDomainMapper.transformPhotos(photoEntities));
  }

  @override
  Future<Photo> getPhoto(String id) {
    return this._dataStore.getPhoto(id).then(
        (photoEntity) => this._dataToDomainMapper.transfrormPhoto(photoEntity));
  }
}

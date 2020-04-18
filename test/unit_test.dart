import 'package:flutter_test/flutter_test.dart';
import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case.dart';
import 'package:ofs_task/locator.dart';

void main() {
  setUpRealLocator();

  String photoId;

  group('App Flow', () {
    test('Search Photo Staus SHOULD pass THEN RETURN true', () async {
      SearchPhotoStatusUseCase searchPhotoStatusUseCase =
          locator<SearchPhotoStatusUseCase>();
      final response = await searchPhotoStatusUseCase.searchPhotoStatus('cats');
      expect(response.status, Status.SUCCESS);
      expect(response.data, true);
    });

    test('Get Photos SHOULD pass THEN RETURN list of photos', () async {
      GetPhotosUseCase getPhotosUseCase = locator<GetPhotosUseCase>();
      final response = await getPhotosUseCase.getPhotos();
      expect(response.status, Status.SUCCESS);
      expect(response.data.length > 0, true);
      photoId = response.data[0].id;
    });

    test('Get Photo by id SHOULD pass THEN RETURN photo', () async {
      GetPhotoUseCase getPhotoUseCase = locator<GetPhotoUseCase>();
      final response = await getPhotoUseCase.getPhoto(photoId);
      expect(response.status, Status.SUCCESS);
      expect(response.data != null, true);
    });
  });

}

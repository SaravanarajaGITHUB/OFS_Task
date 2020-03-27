import 'package:flutter_test/flutter_test.dart';
import 'package:ofs_task/domain/model/response.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case.dart';
import 'package:ofs_task/locator.dart';

void main() {
  setUpRealLocator();

  group('App Flow', () {
    test('Search Photo Staus SHOULD success THEN RETURN true', () async {
      SearchPhotoStatusUseCase searchPhotoStatusUseCase =
          locator<SearchPhotoStatusUseCase>();
      final response = await searchPhotoStatusUseCase.searchPhotoStatus('cats');
      expect(response.status, Status.SUCCESS);
      expect(response.data, true);
    });

    test('Get Photos SHOULD success THEN RETURN list of photos object', () async {
      GetPhotosUseCase getPhotosUseCase = locator<GetPhotosUseCase>();
      final response = await getPhotosUseCase.getPhotos();
      expect(response.status, Status.SUCCESS);
      expect(response.data.length > 0, true);
    });

    test('Get Photo by id SHOULD success THEN RETURN not null photo object', () async {
      GetPhotoUseCase getPhotoUseCase = locator<GetPhotoUseCase>();
      final response = await getPhotoUseCase.getPhoto('49704648892');
      expect(response.status, Status.SUCCESS);
      expect(response.data != null, true);
    });
  });

  //
}

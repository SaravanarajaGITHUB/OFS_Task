import 'package:get_it/get_it.dart';
import 'package:ofs_task/data/repo/repository_impl.dart';
import 'package:ofs_task/data/source/data_store.dart';
import 'package:ofs_task/data/source/data_store_impl.dart';
import 'package:ofs_task/data/store/cache/cache.dart';
import 'package:ofs_task/data/store/cache/cache_impl.dart';
import 'package:ofs_task/data/store/remote/web_service.dart';
import 'package:ofs_task/data/store/remote/web_service_impl.dart';
import 'package:ofs_task/data/utils/data_to_domain_mapper.dart';
import 'package:ofs_task/domain/repo/repository.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case.dart';
import 'package:ofs_task/domain/usecase/get_photo/get_photo_use_case_impl.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case.dart';
import 'package:ofs_task/domain/usecase/get_photos/get_photos_use_case_impl.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case.dart';
import 'package:ofs_task/domain/usecase/search_photo_status/search_photo_status_use_case_impl.dart';
import 'package:ofs_task/domain/utils/domain_to_model_mapper.dart';
import 'package:ofs_task/presentation/ui/photo_detail/photo_detail_view_model.dart';
import 'package:ofs_task/presentation/ui/search_photo/search_photo_view_model.dart';
import 'package:ofs_task/presentation/ui/search_photo_result/search_photo_result_view_model.dart';

GetIt locator = GetIt.instance;

void _setupLocator() {
  // Cache
  locator.registerLazySingleton<Cache>(() => CacheImpl());

  // Data Store
  locator.registerLazySingleton<DataStore>(
      () => DataStoreImpl(locator<WebService>(), locator<Cache>()));

  // Mapper
  locator.registerLazySingleton(() => DataToDomainMapper());
  locator.registerLazySingleton(() => DomainToModelMapper());

  // Repository
  locator.registerLazySingleton<Repository>(() =>
      RepositoryImpl(locator<DataStore>(), locator<DataToDomainMapper>()));

  // UseCase
  locator.registerFactory<SearchPhotoStatusUseCase>(
      () => SearchPhotoStatusUseCaseImpl(locator<Repository>()));
  locator.registerFactory<GetPhotosUseCase>(() => GetPhotosUseCaseImpl(
      locator<Repository>(), locator<DomainToModelMapper>()));
  locator.registerFactory<GetPhotoUseCase>(() => GetPhotoUseCaseImpl(
      locator<Repository>(), locator<DomainToModelMapper>()));

  // View Model
  locator.registerFactory<SearchPhotoViewModel>(
          () => SearchPhotoViewModel(locator<SearchPhotoStatusUseCase>()));
  locator.registerFactory<SearchPhotoResultViewModel>(
          () => SearchPhotoResultViewModel(locator<GetPhotosUseCase>()));
  locator.registerFactory<PhotoDetailViewModel>(
          () => PhotoDetailViewModel(locator<GetPhotoUseCase>()));
}

void setUpRealLocator() {
  locator.registerLazySingleton<WebService>(() => WebServiceImpl());
  _setupLocator();
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ofs_task/presentation/ui/photo_detail/photo_detail_screen.dart';
import 'package:ofs_task/presentation/ui/search_photo/search_photo_screen.dart';
import 'package:ofs_task/presentation/ui/search_photo_result/search_photo_result_screen.dart';

class Router {

  Router._internal();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SearchPhotoScreen.ROUTE_NAME:
        return _buildPageRoute(SearchPhotoScreen(), settings);
      case PhotoResultScreen.ROUTE_NAME:
        return _buildPageRoute(PhotoResultScreen(keyword: settings.arguments), settings);
      case PhotoDetailScreen.ROUTE_NAME:
        return _buildPageRoute(PhotoDetailScreen(photoId:settings.arguments), settings);
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }

  static MaterialPageRoute _buildPageRoute(
      Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }

  static String get initialRoute => SearchPhotoScreen.ROUTE_NAME;
}

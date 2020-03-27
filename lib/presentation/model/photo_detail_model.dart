import 'package:flutter/foundation.dart';

class PhotoDetailModel {
  final String _url;
  final String _title;

  PhotoDetailModel({@required String url, @required String title})
      : this._url = url,
        this._title = title;

  String get url => this._url;

  String get title => this._title;
}

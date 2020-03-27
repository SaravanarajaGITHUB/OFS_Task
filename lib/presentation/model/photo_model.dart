import 'package:flutter/cupertino.dart';

class PhotoModel {
  final String _id;
  final String _url;

  PhotoModel({@required String id, @required String url})
      : this._url = url,
        this._id = id;

  String get id => this._id;

  String get url => this._url;
}

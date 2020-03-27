import 'package:flutter/cupertino.dart';

class PhotoEntity {
  final String _id;
  final String _secret;
  final String _server;
  final String _farm;
  final String _title;
  final bool _isPublic;
  final bool _isFriend;
  final bool _isFamily;

  PhotoEntity(
      {@required String id,
      @required String secret,
      @required String server,
      @required String farm,
      @required String title,
      @required bool isPublic,
      @required bool isFriend,
      @required bool isFamily})
      : this._id = id,
        this._secret = secret,
        this._server = server,
        this._farm = farm,
        this._title = title,
        this._isPublic = isPublic,
        this._isFriend = isFriend,
        this._isFamily = isFamily;

  String get title => this._title;

  String get farm => this._farm;

  String get server => this._server;

  String get secret => this._secret;

  String get id => this._id;

  bool get isFamily => this._isFamily;

  bool get isFriend => this._isFriend;

  bool get isPublic => this._isPublic;


}

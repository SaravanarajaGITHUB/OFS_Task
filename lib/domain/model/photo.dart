import 'package:flutter/cupertino.dart';

class Photo {
  final String _id;
  final String _secret;
  final String _server;
  final String _farm;
  final String _title;

  Photo(
      {@required String id,
      @required String secret,
      @required String server,
      @required farm,
      @required String title})
      : this._id = id,
        this._secret = secret,
        this._server = server,
        this._farm = farm,
        this._title = title;

  String get title => this._title;

  String get farm => this._farm;

  String get server => this._server;

  String get secret => this._secret;

  String get id => this._id;
}

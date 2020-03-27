import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ofs_task/data/model/request/query.dart';
import 'package:ofs_task/data/store/remote/app_exception.dart';
import 'package:ofs_task/data/store/remote/method.dart';

abstract class WebServiceHelper {
  String get getBaseUrl;

  final String _tagRequest = '====== Request =====>';
  final String _tagResponse = '====== Response =====>';

  final JsonDecoder _decoder = JsonDecoder();

  Map<String, String> _headers = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future call(
      {@required String path,
        Map<String, String> headers,
        Encoding encoding,
        @required Method method,
        Map<String, dynamic> body}) async {
    Response responseData;
    final url = getBaseUrl + path;
    debugPrint('$_tagRequest $url');
    if (headers == null) {
      headers = this._headers;
    } else {
      headers.addAll(this._headers);
    }
    try {
      switch (method) {
        case Method.GET:
          responseData = await get(url, headers: headers);
          break;
        case Method.POST:
          debugPrint(json.encode(body).toString());
          responseData = await post(url,
              body: json.encode(body), headers: headers, encoding: encoding);
          break;
        case Method.PUT:
          responseData = await put(url,
              body: json.encode(body), headers: headers, encoding: encoding);
          break;
        case Method.DELETE:
          responseData = await delete(url, headers: headers);
          break;
      }
      debugPrint('$_tagResponse ${responseData.body}');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return this._returnResponse(responseData);
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        var responseJson = _decoder.convert(response.body);
        print(responseJson);
        return responseJson;
      case HttpStatus.badRequest:
        throw BadRequestException(response.body.toString());
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());
      case HttpStatus.internalServerError:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  String getQueryParams(Query query) {
    String params = '';
    query.toMap().forEach((key, value) {
      if (params.isNotEmpty) {
        params += '&$key=$value';
      } else {
        params += '$key=$value';
      }
    });
    return params.isNotEmpty ? '?$params' : '';
  }
}

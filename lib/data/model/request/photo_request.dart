import 'package:flutter/foundation.dart';
import 'package:ofs_task/data/model/request/query.dart';
import 'package:ofs_task/data/utils/data_constants.dart';

class PhotoRequest implements Query {
  final String _searchKeyword;
  final int _pageNo;

  PhotoRequest({@required String searchKeyword, @required int pageNo})
      : this._searchKeyword = searchKeyword,
        this._pageNo = pageNo;

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> query = new Map<String, dynamic>();
    query['method'] = 'flickr.photos.search';
    query['api_key'] = DataConstants.FLICKR_API_KEY;
    query['format'] = 'json';
    query['nojsoncallback'] = 1;
    query['safe_search'] = 1;
    query['text'] = this._searchKeyword;
    query['page'] = this._pageNo;
    return query;
  }
}

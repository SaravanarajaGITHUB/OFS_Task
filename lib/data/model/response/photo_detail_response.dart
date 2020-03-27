import 'package:json_annotation/json_annotation.dart';
import 'package:ofs_task/data/model/response/photo.dart';

part 'photo_detail_response.g.dart';

@JsonSerializable()
class PhotoDetailResponse {
  final int page;
  final int pages;
  @JsonKey(name: 'perpage')
  final int perPage;
  final String total;
  @JsonKey(name: 'photo')
  final List<Photo> photos;

  PhotoDetailResponse(this.page, this.pages, this.perPage, this.total,this.photos);

  factory PhotoDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoDetailResponseFromJson(json);
}

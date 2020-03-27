
import 'package:json_annotation/json_annotation.dart';
import 'package:ofs_task/data/model/response/photo_detail_response.dart';

part 'photo_response.g.dart';

@JsonSerializable()
class PhotoResponse{

  @JsonKey(name: 'photos')
  final PhotoDetailResponse photoDetailResponse;
  @JsonKey(name:'stat')
  final String status;

  PhotoResponse(this.photoDetailResponse, this.status);

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);
}
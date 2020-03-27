// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDetailResponse _$PhotoDetailResponseFromJson(Map<String, dynamic> json) {
  return PhotoDetailResponse(
    json['page'] as int,
    json['pages'] as int,
    json['perpage'] as int,
    json['total'] as String,
    (json['photo'] as List)
        ?.map(
            (e) => e == null ? null : Photo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhotoDetailResponseToJson(
        PhotoDetailResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'perpage': instance.perPage,
      'total': instance.total,
      'photo': instance.photos,
    };

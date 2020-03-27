// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) {
  return PhotoResponse(
    json['photos'] == null
        ? null
        : PhotoDetailResponse.fromJson(json['photos'] as Map<String, dynamic>),
    json['stat'] as String,
  );
}

Map<String, dynamic> _$PhotoResponseToJson(PhotoResponse instance) =>
    <String, dynamic>{
      'photos': instance.photoDetailResponse,
      'stat': instance.status,
    };

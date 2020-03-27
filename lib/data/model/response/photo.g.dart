// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    json['id'] as String,
    json['owner'] as String,
    json['secret'] as String,
    json['server'] as String,
    json['farm'] as int,
    json['title'] as String,
    json['ispublic'] as int,
    json['isfriend'] as int,
    json['isfamily'] as int,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'secret': instance.secret,
      'server': instance.server,
      'farm': instance.farm,
      'title': instance.title,
      'ispublic': instance.isPublic,
      'isfriend': instance.isFriend,
      'isfamily': instance.isFamily,
    };

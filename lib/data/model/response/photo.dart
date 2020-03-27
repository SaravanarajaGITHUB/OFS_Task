import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo{

  final String id;
  final String owner;
  final String secret;
  final String server;
  final int farm;
  final String title;
  @JsonKey(name: 'ispublic')
  final int isPublic;
  @JsonKey(name: 'isfriend')
  final int isFriend;
  @JsonKey(name:'isfamily')
  final int isFamily;

  Photo(this.id, this.owner, this.secret, this.server, this.farm, this.title,
      this.isPublic, this.isFriend, this.isFamily);


  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

}
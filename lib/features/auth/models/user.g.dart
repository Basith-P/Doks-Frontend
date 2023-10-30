// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      profilePic: json['profilePic'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'token': instance.token,
    };

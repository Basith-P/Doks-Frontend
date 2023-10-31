// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: json['_id'] as String?,
      title: json['title'] as String? ?? 'Untitled',
      content: json['content'] as List<dynamic>?,
      ownerId: json['ownerId'] as String?,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocImpl _$$DocImplFromJson(Map<String, dynamic> json) => _$DocImpl(
      id: json['_id'] as String?,
      title: json['title'] as String? ?? 'Untitled',
      content: json['content'] as List<dynamic>?,
      ownerId: json['ownerId'] as String?,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$DocImplToJson(_$DocImpl instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt,
    };

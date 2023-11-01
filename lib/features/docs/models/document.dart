import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Doc with _$Doc {
  const factory Doc({
    @JsonKey(name: '_id') String? id,
    @Default('Untitled') String? title,
    List? content,
    String? ownerId,
    required int createdAt,
  }) = _Doc;

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
}

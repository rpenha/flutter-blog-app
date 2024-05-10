import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:contentful/contentful.dart';

part 'postSummary.g.dart';

@JsonSerializable()
class PostSummary extends Entry<PostSummaryFields> {
  PostSummary({
    required SystemFields sys,
    required PostSummaryFields fields,
  }) : super(sys: sys, fields: fields);

  static PostSummary fromJson(Map<String, dynamic> json) => _$PostSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$PostSummaryToJson(this);
}

@JsonSerializable()
class PostSummaryFields extends Equatable {
  const PostSummaryFields({
    required this.title,
    required this.slug,
    required this.author,
    required this.summary,
    required this.cover
  });

  final String title;
  final String slug;
  final Author author;
  final String summary;
  final Cover cover;

  @override
  List<Object> get props => [title, slug, author, summary, cover];

  static PostSummaryFields fromJson(Map<String, dynamic> json) =>
      _$PostSummaryFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$PostSummaryFieldsToJson(this);
}

@JsonSerializable()
class Author extends Entry<AuthorFields> {
  Author({
    required SystemFields sys,
    required AuthorFields fields,
  }) : super(sys: sys, fields: fields);

  static Author fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class AuthorFields extends Equatable {
  const AuthorFields({
    required this.name,
    required this.slug
});

  final String name;
  final String slug;

  @override
  List<Object?> get props => [name, slug];

  static AuthorFields fromJson(Map<String, dynamic> json) =>
      _$AuthorFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorFieldsToJson(this);
}

@JsonSerializable()
class Cover extends Entry<CoverFields> {
  Cover({
    required SystemFields sys,
    required CoverFields fields,
  }) : super(sys: sys, fields: fields);

  static Cover fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  Map<String, dynamic> toJson() => _$CoverToJson(this);
}

@JsonSerializable()
class CoverFields extends Equatable {
  const CoverFields({
    required this.title,
    required this.description,
    required this.file
  });

  final String title;
  final String description;
  final File file;

  @override
  List<Object?> get props => [title, description, file];

  static CoverFields fromJson(Map<String, dynamic> json) =>
      _$CoverFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$CoverFieldsToJson(this);
}

@JsonSerializable()
class File extends Equatable {
  const File({
    required this.url,
    required this.fileName,
    required this.contentType
  });

  final String url;
  final String fileName;
  final String contentType;

  @override
  List<Object?> get props => [url, fileName, contentType];

  static File fromJson(Map<String, dynamic> json) =>
      _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}

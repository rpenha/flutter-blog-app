// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      sys: SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
      fields: PostFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

PostFields _$PostFieldsFromJson(Map<String, dynamic> json) => PostFields(
      title: json['title'] as String,
      slug: json['slug'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      cover: Cover.fromJson(json['cover'] as Map<String, dynamic>),
      body: json['body'],
    );

Map<String, dynamic> _$PostFieldsToJson(PostFields instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'author': instance.author,
      'summary': instance.summary,
      'cover': instance.cover,
      'body': instance.body,
    };

PostSummary _$PostSummaryFromJson(Map<String, dynamic> json) => PostSummary(
      sys: SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
      fields:
          PostSummaryFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostSummaryToJson(PostSummary instance) =>
    <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

PostSummaryFields _$PostSummaryFieldsFromJson(Map<String, dynamic> json) =>
    PostSummaryFields(
      title: json['title'] as String,
      slug: json['slug'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      cover: Cover.fromJson(json['cover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostSummaryFieldsToJson(PostSummaryFields instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'author': instance.author,
      'summary': instance.summary,
      'cover': instance.cover,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      sys: SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
      fields: AuthorFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

AuthorFields _$AuthorFieldsFromJson(Map<String, dynamic> json) => AuthorFields(
      name: json['name'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$AuthorFieldsToJson(AuthorFields instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
    };

Cover _$CoverFromJson(Map<String, dynamic> json) => Cover(
      sys: SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
      fields: CoverFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

CoverFields _$CoverFieldsFromJson(Map<String, dynamic> json) => CoverFields(
      title: json['title'] as String,
      description: json['description'] as String,
      file: File.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoverFieldsToJson(CoverFields instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
    };

File _$FileFromJson(Map<String, dynamic> json) => File(
      url: json['url'] as String,
      fileName: json['fileName'] as String,
      contentType: json['contentType'] as String,
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'url': instance.url,
      'fileName': instance.fileName,
      'contentType': instance.contentType,
    };

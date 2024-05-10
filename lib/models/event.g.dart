// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      sys: SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
      fields: EventFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

EventFields _$EventFieldsFromJson(Map<String, dynamic> json) => EventFields(
      title: json['title'] as String,
      slug: json['slug'] as String,
      author: json['author'] as String,
      summary: json['summary'] as String,
      coverImage: json['coverImage'] as String,
      relations: (json['relations'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventFieldsToJson(EventFields instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'author': instance.author,
      'summary': instance.summary,
      'coverImage': instance.coverImage,
      'relations': instance.relations,
    };

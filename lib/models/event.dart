import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:contentful/contentful.dart';

part 'event.g.dart';

@JsonSerializable()
class Event extends Entry<EventFields> {
  Event({
    required SystemFields sys,
    required EventFields fields,
  }) : super(sys: sys, fields: fields);

  static Event fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class EventFields extends Equatable {
  const EventFields({
    required this.title,
    required this.slug,
    required this.author,
    required this.summary,
    required this.coverImage,
    required this.relations,
  });

  final String title;
  final String slug;
  final String author;
  final String summary;
  final String coverImage;
  final List<Event> relations;

  @override
  List<Object> get props => [title, slug, author, summary, coverImage, relations];

  static EventFields fromJson(Map<String, dynamic> json) =>
      _$EventFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$EventFieldsToJson(this);
}

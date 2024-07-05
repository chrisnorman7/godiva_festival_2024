// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_acts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestivalActs _$FestivalActsFromJson(Map<String, dynamic> json) => FestivalActs(
      (json['acts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$FestivalActsToJson(FestivalActs instance) =>
    <String, dynamic>{
      'acts': instance.acts,
    };

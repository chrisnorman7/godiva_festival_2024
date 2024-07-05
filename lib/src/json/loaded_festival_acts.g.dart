// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loaded_festival_acts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadedFestivalActs _$LoadedFestivalActsFromJson(Map<String, dynamic> json) =>
    LoadedFestivalActs(
      (json['acts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$LoadedFestivalActsToJson(LoadedFestivalActs instance) =>
    <String, dynamic>{
      'acts': instance.acts,
    };

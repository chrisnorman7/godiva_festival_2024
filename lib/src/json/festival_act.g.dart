// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'festival_act.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FestivalAct _$FestivalActFromJson(Map<String, dynamic> json) => FestivalAct(
      name: json['name'] as String,
      when: DateTime.parse(json['when'] as String),
      stage: $enumDecode(_$FestivalStageEnumMap, json['stage']),
    );

Map<String, dynamic> _$FestivalActToJson(FestivalAct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'when': instance.when.toIso8601String(),
      'stage': _$FestivalStageEnumMap[instance.stage]!,
    };

const _$FestivalStageEnumMap = {
  FestivalStage.mainStage: 'mainStage',
  FestivalStage.theNextStage: 'theNextStage',
  FestivalStage.serendipityStage: 'serendipityStage',
  FestivalStage.theCovStage: 'theCovStage',
  FestivalStage.covConneXKingstonStage: 'covConneXKingstonStage',
  FestivalStage.theResonateStage: 'theResonateStage',
};

import 'package:json_annotation/json_annotation.dart';

import 'festival_stage.dart';

part 'festival_act.g.dart';

/// An act in the festival.
@JsonSerializable()
class FestivalAct {
  /// Create an instance.
  const FestivalAct({
    required this.name,
    required this.when,
    required this.stage,
  });

  /// Create an instance from a JSON object.
  factory FestivalAct.fromJson(final Map<String, dynamic> json) =>
      _$FestivalActFromJson(json);

  /// The name of the act.
  final String name;

  /// The date and time of the act.
  final DateTime when;

  /// The stage which the act is on.
  final FestivalStage stage;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$FestivalActToJson(this);
}

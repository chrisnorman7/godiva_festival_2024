import 'package:json_annotation/json_annotation.dart';

part 'festival_acts.g.dart';

/// A list of festival acts.
@JsonSerializable()
class FestivalActs {
  /// Create an instance.
  const FestivalActs(this.acts);

  /// Create an instance from a JSON object.
  factory FestivalActs.fromJson(final Map<String, dynamic> json) =>
      _$FestivalActsFromJson(json);

  /// The acts to show.
  final List<Map<String, dynamic>> acts;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$FestivalActsToJson(this);
}

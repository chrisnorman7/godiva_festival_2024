import 'package:json_annotation/json_annotation.dart';

part 'loaded_festival_acts.g.dart';

/// Loaded act maps.
@JsonSerializable()
class LoadedFestivalActs {
  /// Create an instance.
  const LoadedFestivalActs(this.acts);

  /// Create an instance from a JSON object.
  factory LoadedFestivalActs.fromJson(final Map<String, dynamic> json) =>
      _$LoadedFestivalActsFromJson(json);

  /// The act maps.
  final List<Map<String, dynamic>> acts;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$LoadedFestivalActsToJson(this);
}

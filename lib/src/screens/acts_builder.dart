import 'dart:convert';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../json/festival_act.dart';
import '../json/loaded_festival_acts.dart';
import 'acts_screen.dart';

/// A screen showing all the acts.
class ActsBuilder extends StatelessWidget {
  /// Create an instance.
  const ActsBuilder({
    super.key,
  });

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final future = getActs(context);
    return SimpleFutureBuilder(
      future: future,
      done: (final context, final acts) {
        if (acts == null || acts.isEmpty) {
          return const LoadingScreen();
        }
        acts.sort(
          (final a, final b) => a.when.compareTo(b.when),
        );
        return ActsScreen(acts: acts);
      },
      loading: LoadingScreen.new,
      error: ErrorScreen.withPositional,
    );
  }

  /// Load all the acts.
  Future<List<FestivalAct>> getActs(final BuildContext context) async {
    final string = await DefaultAssetBundle.of(context).loadString(Assets.acts);
    final map = jsonDecode(string) as Map<String, dynamic>;
    final acts = <FestivalAct>[];
    for (final MapEntry(key: stageName, value: map) in map.entries) {
      final loadedActs = LoadedFestivalActs.fromJson(
        map as Map<String, dynamic>,
      );
      acts.addAll(
        loadedActs.acts.map(
          (final map) {
            map['stage'] = stageName;
            return FestivalAct.fromJson(map);
          },
        ),
      );
    }
    return acts;
  }
}

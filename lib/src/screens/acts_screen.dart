import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';

import '../json/festival_act.dart';
import '../json/festival_stage.dart';
import '../widgets/acts_list_view.dart';

/// Show the loaded [acts].
class ActsScreen extends StatefulWidget {
  /// Create an instance.
  const ActsScreen({
    required this.acts,
    super.key,
  });

  /// The acts that have been loaded.
  final List<FestivalAct> acts;

  /// Create state for this widget.
  @override
  ActsScreenState createState() => ActsScreenState();
}

/// State for [ActsScreen].
class ActsScreenState extends State<ActsScreen> {
  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final now = DateTime.now();
    final oldActs = widget.acts.where(
      (final act) => act.when.isBefore(now),
    );
    final refreshButton = IconButton(
      onPressed: () => setState(() {}),
      icon: const Icon(
        Icons.refresh_outlined,
        semanticLabel: 'Refresh',
      ),
    );
    return TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          actions: [refreshButton],
          title: 'On now',
          icon: const Icon(Icons.mic_outlined),
          builder: (final context) {
            final acts = <FestivalStage, FestivalAct>{};
            for (final act in oldActs.toList().reversed) {
              if (act.when.day != now.day) {
                continue;
              }
              acts.putIfAbsent(
                act.stage,
                () => act,
              );
            }
            return ActsListView(acts: acts.values.toList());
          },
        ),
        TabbedScaffoldTab(
          actions: [refreshButton],
          title: 'Coming up',
          icon: const Icon(Icons.alarm_outlined),
          builder: (final context) {
            final acts = widget.acts.where(
              (final act) => act.when.isAfter(now),
            );
            return ActsListView(acts: acts.toList());
          },
        ),
        TabbedScaffoldTab(
          actions: [refreshButton],
          title: 'Already happened',
          icon: const Icon(Icons.history_outlined),
          builder: (final context) => ActsListView(
            acts: oldActs.isEmpty ? <FestivalAct>[] : oldActs.toList(),
          ),
        ),
        TabbedScaffoldTab(
          title: 'All',
          icon: const Icon(Icons.all_inbox_outlined),
          builder: (final context) => ActsListView(acts: widget.acts),
        ),
      ],
    );
  }
}

import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';

import '../json/festival_act.dart';
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
    final oldActsIterable = widget.acts.where(
      (final act) => act.when.isBefore(now),
    );
    final oldActs =
        oldActsIterable.isEmpty ? <FestivalAct>[] : oldActsIterable.toList();
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
          title: 'Already Happened',
          icon: const Icon(
            Icons.mic_outlined,
          ),
          builder: (final context) => ActsListView(acts: oldActs),
        ),
        TabbedScaffoldTab(
          actions: [
            refreshButton,
          ],
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
          title: 'All',
          icon: const Icon(Icons.all_inbox_outlined),
          builder: (final context) => ActsListView(acts: widget.acts),
        ),
      ],
    );
  }
}

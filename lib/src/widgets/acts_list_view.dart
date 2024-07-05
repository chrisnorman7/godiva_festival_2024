import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

import '../json/festival_act.dart';

/// A [ListView] to show [acts].
class ActsListView extends StatelessWidget {
  /// Create an instance.
  const ActsListView({
    required this.acts,
    super.key,
  });

  /// The acts to show.
  final List<FestivalAct> acts;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    if (acts.isEmpty) {
      return const CenterText(
        text: 'There are no acts to show.',
        autofocus: true,
      );
    }
    final formatter = DateFormat('EEEE HH:mm');
    return ListView.builder(
      itemBuilder: (final context, final index) {
        final act = acts[index];
        return ListTile(
          autofocus: index == 0,
          title: Text('${act.name} (${act.stage.name.titleCase})'),
          subtitle: Text(formatter.format(act.when)),
          onTap: () {},
        );
      },
      itemCount: acts.length,
      shrinkWrap: true,
    );
  }
}

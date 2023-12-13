import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/widgets/custom_divider.dart';
import 'package:sports_events_app/widgets/sport_event_item_widget.dart';

class SportEventList extends StatelessWidget {
  final List<SportEventModel> sportEvents;
  final Function(SportEventModel) onTap;
  const SportEventList({super.key, this.sportEvents = const [], required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: sportEvents.length,
        itemBuilder: (context, index) {
          final sportEvent = sportEvents[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SportEventItemWidget(sportEvent: sportEvent, onTap: onTap),
          );
        },
        separatorBuilder: (context, index) => const CustomDivider());
  }
}

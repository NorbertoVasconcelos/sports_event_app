import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_events_app/models/sport_event_date_enum.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';
import 'package:sports_events_app/screens/sport_events_details.dart';
import 'package:sports_events_app/widgets/date_tab_bar.dart';
import 'package:sports_events_app/widgets/sport_event_app_bar.dart';
import 'package:sports_events_app/widgets/sport_event_list.dart';

class SportEventsScreen extends StatelessWidget {
  const SportEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sportEventNotifier = Provider.of<SportEventNotifier>(context)..initialize();
    return Scaffold(
      appBar: SportEventAppBar(
        bottomHeight: DateTabBar.height,
        bottom: DateTabBar(horizontalMargin: MediaQuery.of(context).size.width * 0.15),
      ),
      body: ChangeNotifierProvider.value(
        value: sportEventNotifier,
        child: Consumer<SportEventNotifier>(
          builder: (context, sportEventNotifier, child) {
            if (sportEventNotifier.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final sportEvent = sportEventNotifier.sportEvent;
            if (sportEvent != null) {
              return SportEventsDetails(
                sportEvent: sportEvent,
                onBackTap: () => sportEventNotifier.setSportEvent(null),
              );
            }

            final filteredSportEvents = sportEventNotifier.sportEventsByDate;
            return SportEventList(
              sportEvents: filteredSportEvents,
              onTap: (sportEvent) {
                sportEventNotifier.setSportEvent(sportEvent);
              },
            );
          },
        ),
      ),
    );
  }

  List<SportEventModel> filterSportEventsByDate(List<SportEventModel> sportEvents, SportEventDate date) {
    return sportEvents.where((sportEvent) => sportEvent.date == date).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_events_app/models/sport_event_date_enum.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';
import 'package:sports_events_app/repositories/sport_event_repository.dart';
import 'package:sports_events_app/screens/sport_events_details.dart';
import 'package:sports_events_app/widgets/date_tab_bar.dart';
import 'package:sports_events_app/widgets/sport_event_app_bar.dart';
import 'package:sports_events_app/widgets/sport_event_list.dart';

class SportEventsScreen extends StatelessWidget {
  final SportEventRepository sportEventRepository;

  const SportEventsScreen({super.key, required this.sportEventRepository});

  @override
  Widget build(BuildContext context) {
    final sportEventNotifier = Provider.of<SportEventNotifier>(context);
    return Scaffold(
      appBar: SportEventAppBar(
        bottomHeight: DateTabBar.height,
        bottom: DateTabBar(horizontalMargin: MediaQuery.of(context).size.width * 0.15),
      ),
      body: FutureBuilder(
        future: sportEventRepository.getSportEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider.value(
              value: sportEventNotifier,
              child: Consumer<SportEventNotifier>(
                builder: (context, sportEventNotifier, child) {
                  final sportEvent = sportEventNotifier.sportEvent;
                  if (sportEvent != null) {
                    return SportEventsDetails(
                      sportEvent: sportEvent,
                      onBackTap: () => sportEventNotifier.setSportEvent(null),
                    );
                  }

                  final sportEvents = snapshot.data as List<SportEventModel>;
                  final filteredSportEvents = filterSportEventsByDate(sportEvents, sportEventNotifier.selectedDate);
                  return SportEventList(
                    sportEvents: filteredSportEvents,
                    onTap: (sportEvent) {
                      sportEventNotifier.setSportEvent(sportEvent);
                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<SportEventModel> filterSportEventsByDate(List<SportEventModel> sportEvents, SportEventDate date) {
    return sportEvents.where((sportEvent) => sportEvent.date == date).toList();
  }
}

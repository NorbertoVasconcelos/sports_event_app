import 'package:sports_events_app/models/sport_event_date_enum.dart';

class SportEventModel {
  final String iconUrl;
  final String league;
  final String teams;
  final String sportType;
  final String dateStarting;
  final String timeStarting;

  SportEventModel({
    required this.iconUrl,
    required this.league,
    required this.teams,
    required this.sportType,
    required this.dateStarting,
    required this.timeStarting,
  });

  SportEventDate get date => SportEventDateExtension.fromString(dateStarting);
}

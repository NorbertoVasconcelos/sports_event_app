import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sport_event_date_enum.dart';
import 'package:sports_events_app/models/sport_event_model.dart';

class SportEventNotifier extends ChangeNotifier {
  SportEventDate _selectedDate = SportEventDate.today;
  final Map<SportEventDate, SportEventModel?> _selectedSportEvent = {};

  void setSportEvent(SportEventModel? sportEvent) {
    _selectedSportEvent[_selectedDate] = sportEvent;
    notifyListeners();
  }

  void setDate(SportEventDate date) {
    _selectedDate = date;
    notifyListeners();
  }

  SportEventModel? get sportEvent {
    return _selectedSportEvent[_selectedDate];
  }

  SportEventDate get selectedDate => _selectedDate;
}

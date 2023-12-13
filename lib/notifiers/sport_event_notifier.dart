import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sport_event_date_enum.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/repositories/sport_event_repository.dart';

class SportEventNotifier extends ChangeNotifier {
  final SportEventRepository sportEventRepository;
  final Map<SportEventDate, SportEventModel?> _selectedSportEvent = {};
  SportEventDate _selectedDate = SportEventDate.today;
  List<SportEventModel>? _sportEvents;

  SportEventNotifier({required this.sportEventRepository});

  void initialize() async {
    _sportEvents = await sportEventRepository.getSportEvents();
    notifyListeners();
  }

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

  List<SportEventModel> get sportEvents {
    return _sportEvents ?? [];
  }

  List<SportEventModel> get sportEventsByDate {
    return _sportEvents?.where((sportEvent) => sportEvent.date == _selectedDate).toList() ?? [];
  }

  bool get isLoading => _sportEvents == null;
}

import 'package:sports_events_app/models/sport_event_model.dart';

abstract class SportEventRepository {
  Future<List<SportEventModel>> getSportEvents();
}

class LocalSportEventRepository extends SportEventRepository {
  @override
  Future<List<SportEventModel>> getSportEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'FC Porto vs. Sporting CP',
        sportType: 'Football',
        dateStarting: 'Yesterday',
        timeStarting: '19:30',
      ),
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'SL Benfica vs. SC Braga',
        sportType: 'Football',
        dateStarting: 'Yesterday',
        timeStarting: '20:00',
      ),
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'FC Famalicão vs. Boavista FC',
        sportType: 'Football',
        dateStarting: 'Today',
        timeStarting: '18:45',
      ),
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'Vitória SC vs. CD Tondela',
        sportType: 'Football',
        dateStarting: 'Today',
        timeStarting: '19:00',
      ),
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'Gil Vicente FC vs. Moreirense FC',
        sportType: 'Football',
        dateStarting: 'Tomorrow',
        timeStarting: '20:15',
      ),
      SportEventModel(
        iconUrl: 'assets/icons/sports-icon.svg',
        league: 'Liga\n1ª',
        teams: 'CD Santa Clara vs. Marítimo',
        sportType: 'Football',
        dateStarting: 'Tomorrow',
        timeStarting: '20:30',
      ),
    ];
  }
}

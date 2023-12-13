import 'package:flutter_test/flutter_test.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';
import 'package:sports_events_app/repositories/sport_event_repository.dart';

void main() {
  group('SportEventNotifier', () {
    late SportEventNotifier sportEventNotifier;
    late LocalSportEventRepository localRepository;

    setUp(() {
      localRepository = LocalSportEventRepository();
      sportEventNotifier = SportEventNotifier(sportEventRepository: localRepository);
    });

    test('initialize sets sport events and notifies listeners', () async {
      await sportEventNotifier.initialize();
      final repoSportEvents = await localRepository.getSportEvents();

      expect(sportEventNotifier.sportEvents.length, repoSportEvents.length);
      expect(sportEventNotifier.isLoading, false);
    });

    test('setSportEvent updates selected sport event and notifies listeners', () {
      final SportEventModel mockSportEvent = SportEventModel.mock;

      sportEventNotifier.setSportEvent(mockSportEvent);

      expect(sportEventNotifier.sportEvent, mockSportEvent);
    });
  });
}

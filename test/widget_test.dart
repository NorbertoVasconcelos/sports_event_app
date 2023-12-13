import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';
import 'package:sports_events_app/repositories/sport_event_repository.dart';
import 'package:sports_events_app/screens/sport_events_details.dart';
import 'package:sports_events_app/screens/sport_events_screen.dart';
import 'package:sports_events_app/widgets/sport_event_list.dart';

void main() {
  testWidgets('SportEventsScreen displays CircularProgressIndicator when loading', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => SportEventNotifier(sportEventRepository: LocalSportEventRepository()),
            child: const SportEventsScreen(),
          ),
        ),
      );
      // Assert that the CircularProgressIndicator is present
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  testWidgets('SportEventsScreen displays SportEventsDetails when a sport event IS selected',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      final sportEvent = SportEventModel.mock;
      final sportEventNotifier = SportEventNotifier(sportEventRepository: LocalSportEventRepository());
      await sportEventNotifier.initialize();
      sportEventNotifier.setSportEvent(sportEvent);

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: sportEventNotifier,
            child: const SportEventsScreen(),
          ),
        ),
      );

      await tester.pump();

      final sportEventsDetailsFinder = find.byType(SportEventsDetails);
      expect(sportEventsDetailsFinder, findsOneWidget);
    });
  });

  testWidgets('SportEventsScreen displays SportEventList when sportEvent is NOT selected', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final sportEventNotifier = SportEventNotifier(sportEventRepository: LocalSportEventRepository());
      await sportEventNotifier.initialize();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: sportEventNotifier,
            child: const SportEventsScreen(),
          ),
        ),
      );

      final sportEventListFinder = find.byType(SportEventList);
      expect(sportEventListFinder, findsOneWidget);
    });
  });
}

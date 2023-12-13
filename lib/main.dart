import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';
import 'package:sports_events_app/repositories/sport_event_repository.dart';
import 'package:sports_events_app/screens/sport_events_screen.dart';
import 'package:sports_events_app/styleguide/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SportEventNotifier(sportEventRepository: LocalSportEventRepository()),
      child: MaterialApp(
        title: 'Sports Events App',
        theme: SportThemes.getCurrentTheme(context),
        home: const SportEventsScreen(),
      ),
    );
  }
}

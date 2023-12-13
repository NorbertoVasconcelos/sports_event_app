import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_events_app/models/sport_event_model.dart';

class SportEventItemWidget extends StatelessWidget {
  final SportEventModel sportEvent;
  final Function(SportEventModel) onTap;
  const SportEventItemWidget({super.key, required this.sportEvent, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => onTap(sportEvent),
        focusColor: Theme.of(context).colorScheme.secondary,
        leading: SvgPicture.asset(sportEvent.iconUrl),
        title: Text(
          '${sportEvent.dateStarting} | ${sportEvent.timeStarting}',
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        subtitle: Text(
          sportEvent.teams,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        trailing: CircleAvatar(
          radius: 27,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              sportEvent.league.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_events_app/models/sport_event_model.dart';
import 'package:sports_events_app/widgets/custom_divider.dart';

class SportEventsDetails extends StatelessWidget {
  final SportEventModel sportEvent;
  final Function() onBackTap;
  const SportEventsDetails({super.key, required this.sportEvent, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: InkWell(
          onTap: onBackTap,
          child: Row(children: [
            const SizedBox(width: 19),
            SvgPicture.asset('assets/icons/ic_back_arrow.svg'),
            const SizedBox(width: 10),
            const Text(
              'Go Back',
              style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            _Header(sportEvent: sportEvent),
            const SizedBox(height: 15),
            const CustomDivider(
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 39),
            SvgPicture.asset(sportEvent.iconUrl),
            const SizedBox(height: 22),
            const _Description(),
          ]),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final SportEventModel sportEvent;
  const _Header({required this.sportEvent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 52),
        CircleAvatar(
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
        ),
        const SizedBox(height: 22),
        Text(
          '${sportEvent.dateStarting} | ${sportEvent.timeStarting}',
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        Text(
          sportEvent.teams,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  final fillerText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Sed euismod, diam id aliquam ultrices, nisl nisi aliquet nunc, '
      'eu tincidunt nisl mauris ac nunc. Donec eget nisl nec nisl '
      'consectetur aliquet. Donec euismod, diam id aliquam ultrices, '
      'nisl nisi aliquet nunc, eu tincidunt nisl mauris ac nunc. '
      'Donec eget nisl nec nisl consectetur aliquet.';

  const _Description();

  @override
  Widget build(BuildContext context) {
    return Text(
      fillerText,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        height: 0,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}

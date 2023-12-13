import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_events_app/models/sport_event_date_enum.dart';
import 'package:sports_events_app/notifiers/sport_event_notifier.dart';

class DateTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 28;
  final double horizontalMargin;
  const DateTabBar({super.key, this.horizontalMargin = 0});

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final double tabSize = (MediaQuery.of(context).size.width - (2 * horizontalMargin)) / 3;
    final sportEventNotifier = Provider.of<SportEventNotifier>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      color: Theme.of(context).colorScheme.secondary,
      child: Stack(
        children: [
          Row(children: [
            Expanded(
              child: DateTabBarItem(
                text: SportEventDate.yesterday.name,
                isSelected: sportEventNotifier.selectedDate == SportEventDate.yesterday,
                onTap: () => sportEventNotifier.setDate(SportEventDate.yesterday),
              ),
            ),
            Expanded(
              child: DateTabBarItem(
                text: SportEventDate.today.name,
                isSelected: sportEventNotifier.selectedDate == SportEventDate.today,
                onTap: () => sportEventNotifier.setDate(SportEventDate.today),
              ),
            ),
            Expanded(
              child: DateTabBarItem(
                text: SportEventDate.tomorrow.name,
                isSelected: sportEventNotifier.selectedDate == SportEventDate.tomorrow,
                onTap: () => sportEventNotifier.setDate(SportEventDate.tomorrow),
              ),
            ),
          ]),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            bottom: 0,
            left: sportEventNotifier.selectedDate == SportEventDate.yesterday
                ? 0
                : sportEventNotifier.selectedDate == SportEventDate.today
                    ? tabSize
                    : tabSize * 2,
            child: Container(
              width: tabSize,
              height: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class DateTabBarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;

  const DateTabBarItem({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color:
                isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

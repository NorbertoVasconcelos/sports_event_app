import 'package:flutter/material.dart';

class SportEventAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  final double bottomHeight;
  const SportEventAppBar({super.key, required this.bottom, required this.bottomHeight});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + bottomHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Image.asset(
        'assets/images/logo_placeholder.png',
        height: kToolbarHeight,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      centerTitle: true,
      bottom: bottom,
    );
  }
}

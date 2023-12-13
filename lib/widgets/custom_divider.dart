import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double indent;
  final double endIndent;
  const CustomDivider({super.key, this.indent = 20, this.endIndent = 20});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: indent,
      endIndent: endIndent,
      color: const Color(0xFFF0F0F0),
    );
  }
}

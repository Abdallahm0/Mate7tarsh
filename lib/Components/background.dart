import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const Background({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white, // Def, required MaterialColor backgroundColorault to white
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Background color: $backgroundColor');
    return Container(
      color: backgroundColor, // Apply the background color
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class TappedWidget extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;
  final BorderRadius? borderRadius;

  const TappedWidget({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}

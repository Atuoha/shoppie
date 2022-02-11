import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String count;
  final Color color;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Badge({required this.child, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 4,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // ignore: prefer_if_null_operators, unnecessary_null_comparison
              color: color,
            ),
            constraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

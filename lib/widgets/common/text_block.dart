import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const TextBlock({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              style: TextStyle(
                fontSize: 16,
              ),
              text,
            ),
          ),
          Positioned(
            bottom: -30,
            right: -20,
            child: Icon(
              size: 86,
              color: iconColor?.withAlpha(200),
              icon,
            ),
          ),
        ],
      ),
    );
  }
}

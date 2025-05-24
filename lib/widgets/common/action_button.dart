import 'package:flutter/material.dart';
import 'package:medrocket_home_task_1/utility/colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final ActionButtonType type;
  final Function()? callback;

  const ActionButton({
    super.key,
    required this.text,
    this.type=ActionButtonType.primary,
    this.callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          text,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case ActionButtonType.primary:
        return AppColors.accent;
      case ActionButtonType.secondary:
        return AppColors.backgroundSecondary;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case ActionButtonType.primary:
        return AppColors.textLight;
      case ActionButtonType.secondary:
        return AppColors.accent;
    }
  }
}

enum ActionButtonType{
  primary,
  secondary,
}

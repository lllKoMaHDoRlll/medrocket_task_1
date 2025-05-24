import 'package:flutter/material.dart';
import 'package:medrocket_home_task_1/utility/colors.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? icon;

  const ItemCard({
    super.key,
    required this.title,
    this.subTitle,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 40,
        children: [
          Icon(
            color: AppColors.textSecondary,
            size: 32,
            icon
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
                title,
              ),
              if (subTitle != null) Text(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
                subTitle!,
              ),
            ],
          )
        ],
      ),
    );
  }
}

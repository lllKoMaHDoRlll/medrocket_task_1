import 'package:flutter/material.dart';
import 'package:medrocket_home_task_1/utility/colors.dart';
import 'package:medrocket_home_task_1/utility/images.dart';
import 'package:medrocket_home_task_1/widgets/common/action_button.dart';
import 'package:medrocket_home_task_1/widgets/common/item_card.dart';
import 'package:medrocket_home_task_1/widgets/common/text_block.dart';

class NewDocumentForm extends StatelessWidget {
  const NewDocumentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              Image.asset(
                height: 113,
                width: 343,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                AppImages.newDocumentHero
              ),
              ItemCard(title: "Ирина", icon: Icons.person_outline_rounded,),
              ItemCard(title: "22 мая (вт), 16:00", subTitle: "Дата получения документа", icon: Icons.calendar_today_outlined,),
              ItemCard(title: "Клиника «Фомина»", subTitle: "Бульвар Перервинский, д. 4", icon: Icons.health_and_safety_outlined,),
              ItemCard(title: "Стоматолог", icon: Icons.badge_outlined,),
              TextBlock(
                text: "Клиника прислала документ после приёма. Чтобы добавить его в медкарту и посмотреть содержание, нужно будет указать дату рождения пациента. Это проверка для безопасности данных.",
                backgroundColor: AppColors.warnLight,
                icon: Icons.info_outline_rounded,
                iconColor: AppColors.warn,
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            ActionButton(text: "Добавить в медкарту", type: ActionButtonType.primary, callback: () => print("Add button clicked"),),
            ActionButton(text: "Удалить", type: ActionButtonType.secondary, callback: () => print("Delete button clicked"),),
          ],
        )
      ],
    );
  }
}

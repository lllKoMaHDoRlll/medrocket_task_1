import 'package:flutter/material.dart';
import 'package:medrocket_home_task_1/utility/colors.dart';
import 'package:medrocket_home_task_1/widgets/new_document_form.dart';

class NewDocumentPage extends StatelessWidget {
  const NewDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textPrimary,
        ),
        title: const Text(
          "Новый документ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary
          ),
        ),
        shadowColor: AppColors.textSecondary,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16.0, right: 16.0, top: 32.0),
          child: NewDocumentForm(),
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medrocket_home_task_1/pages/new_document_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewDocumentPage(),
    );
  }
}

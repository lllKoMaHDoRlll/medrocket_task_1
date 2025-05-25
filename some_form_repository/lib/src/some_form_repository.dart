import 'dart:async';

import 'package:some_form_api/some_form_api.dart' hide SomeFormData;
import 'package:some_form_repository/some_form_repository.dart';

class SomeFormRepository {
  SomeFormRepository({SomeFormApiClient? someFormApiClient})
    : _someFormApiClient = someFormApiClient ?? SomeFormApiClient();

  final SomeFormApiClient _someFormApiClient;

  Future<SomeFormData> getSomeFormData() async {
    final someFormData = await _someFormApiClient.getSomeFormData();
    return SomeFormData(
      progress: someFormData.progress,
      status: convertProgressToStatus(someFormData.progress),
    );
  }

  static SomeFormStatus convertProgressToStatus(final double progress) {
    if (progress == 0.0) return SomeFormStatus.notStarted;
    if (progress == 1.0) return SomeFormStatus.completed;
    return SomeFormStatus.inProgress;
  }

  void dispose() => _someFormApiClient.close();
}

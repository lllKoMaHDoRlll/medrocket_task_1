import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:some_form_api/some_form_api.dart';

class SomeFormDataRequestFailure implements Exception {}

class SomeFormDataNotFoundFailure implements Exception {}

const bool isMocked = true;

class SomeFormApiClient {
  SomeFormApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'some-form-api.url';

  final http.Client _httpClient;

  Future<SomeFormData> getSomeFormData() async {
    if (isMocked) {
      await Future.delayed(Duration(seconds: 1));
      final rng = Random();
      final mediumProgress = rng.nextDouble();
      final randomizedProgressList = [0.0, mediumProgress - (mediumProgress % 0.01), 1.0][rng.nextInt(3)];
      return SomeFormData(progress: randomizedProgressList);
    }

    final someFormDataRequest = Uri.https(
      _baseUrl,
      '/some/endpoint',
    );

    final someFormDataResponse = await _httpClient.get(someFormDataRequest);

    if (someFormDataResponse.statusCode != 200) {
      throw SomeFormDataRequestFailure();
    }

    final someFormDataJson = jsonDecode(someFormDataResponse.body) as Map;

    if (!someFormDataJson.containsKey('results')) throw SomeFormDataNotFoundFailure();

    final results = someFormDataJson['results'] as List;

    if (results.isEmpty) throw SomeFormDataNotFoundFailure();

    return SomeFormData.fromJson(results.first as Map<String, dynamic>);
  }

  void close() {
    _httpClient.close();
  }
}

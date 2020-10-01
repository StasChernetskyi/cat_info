import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:cat_info/model/cat.dart';

class CatApiClient {
  static const String baseUrl = 'https://api.thecatapi.com/v1/';
  final Client httpClient;

  CatApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Cat>> fetchCatsInfo() async {
    final catsInfoUrl = '$baseUrl/breeds';
    final catsInfoResponse = await this.httpClient.get(catsInfoUrl);

    if (catsInfoResponse.statusCode != 200) {
      throw Exception('error getting cats info');
    }

    final catsInfoJson = jsonDecode(catsInfoResponse.body);
    return catsInfoJson
        .map((catInfoJson) => Cat.fromJson(catsInfoJson))
        .toList();
  }

  Future<String> fetchCatImageUrl({@required String breed_id}) async {
    final catImageUrl = '$baseUrl/images/search?limit=1&breed_id=$breed_id';
    final catImageResponse = await this.httpClient.get(catImageUrl);

    if (catImageResponse.statusCode != 200) {
      throw Exception('error getting cats info image');
    }

    final catImageJson = jsonDecode(catImageResponse.body);
    return catImageJson.first['url'];
  }
}

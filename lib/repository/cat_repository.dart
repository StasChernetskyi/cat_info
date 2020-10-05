import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/repository/cat_api_client.dart';

class CatRepository {
  final CatApiClient catApiClient;

  CatRepository({@required this.catApiClient}) : assert(catApiClient != null);

  Future<List<Cat>> getCatsInfo() async {
    List<Cat> catsInfo = await catApiClient.fetchCatsInfo();

    for (int i = 0; i < catsInfo.length; ++i) {
      catsInfo[i].imageUrl =
          await catApiClient.fetchCatImageUrl(breed_id: catsInfo[i].id);
    }

    return catsInfo;
  }
}

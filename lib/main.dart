import 'package:cat_info/bloc/cat_info/cat_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:cat_info/repository/cat_api_client.dart';
import 'package:cat_info/repository/cat_repository.dart';

void main() {
  final CatRepository catRepository = CatRepository(
    catApiClient: CatApiClient(httpClient: Client()),
  );
  runApp(CatInfoApp(catRepository: catRepository));
}

class CatInfoApp extends StatelessWidget {
  final CatRepository catRepository;

  CatInfoApp({Key key, @required this.catRepository})
      : assert(catRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Info',
      home: BlocProvider(
        create: (context) => CatInfoBloc(
          catRepository: catRepository,
        ),
        child: BlocBuilder<CatInfoBloc, CatInfoState>(
          builder: (context, state) {
            
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'package:cat_info/repository/cat_api_client.dart';
import 'package:cat_info/repository/cat_repository.dart';
import 'package:cat_info/bloc/cat_info/bloc.dart';
import 'package:cat_info/page/pages.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CatInfoBloc(
              catRepository: catRepository,
            )..add(CatInfoRequested()),
          ),
        ],
        child: BlocBuilder<CatInfoBloc, CatInfoState>(
          builder: (context, loadState) {
            if (loadState is CatInfoLoadInProgress) {
              return SplashScreen();
            } else if (loadState is CatInfoLoadSuccess) {
              return CatListPage(catsInfo: loadState.catsInfo);
            } else {
              onCatInfoLoadFailure(context);
              return SplashScreen();
            }
          },
        ),
      ),
    );
  }

  void onCatInfoLoadFailure(BuildContext context) =>
      BlocProvider.of<CatInfoBloc>(context).add(CatInfoRequested());
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'package:cat_info/repository/cat_repository.dart';

class CatInfoBloc extends Bloc<CatInfoEvent, CatInfoState> {
  final CatRepository catRepository;

  CatInfoBloc({@required this.catRepository}) : super(CatInfoInitial());

  @override
  Stream<CatInfoState> mapEventToState(CatInfoEvent event) async* {
    if (event is CatInfoRequested) {
      yield* _mapCatInfoLoadedToState();
    }
  }

  Stream<CatInfoState> _mapCatInfoLoadedToState() async* {
    try {
      yield CatInfoLoadInProgress();
      final catsInfo = await catRepository.getCatsInfo();
      yield CatInfoLoadSuccess(catsInfo: catsInfo);
    } catch (_) {
      yield CatInfoLoadFailure();
    }
  }
}

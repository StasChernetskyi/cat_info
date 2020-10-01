import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cat_info.dart';
import 'package:cat_info/repository/cat_repository.dart';

class CatInfoBloc extends Bloc<CatInfoEvent, CatInfoState> {
  final CatRepository catRepository;

  CatInfoBloc({@required this.catRepository})
      : super(CatInfoLoadInProgress());

  @override
  Stream<CatInfoState> mapEventToState(CatInfoEvent event) async* {
    if (event is CatInfoRequested) {
      yield* _mapCatInfoLoadedToState();
    }
  }

  Stream<CatInfoState> _mapCatInfoLoadedToState() async* {
    try {
      final cats = await catRepository.getCats();
      yield CatInfoLoadSuccess(cats: cats);
    } catch (_) {
      yield CatInfoLoadFailure();
    }
  }
}

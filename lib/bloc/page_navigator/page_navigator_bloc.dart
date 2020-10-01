import 'package:cat_info/bloc/page_navigator/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageNavigatorBloc extends Bloc<PageNavigatorEvent, PageNavigatorState> {
  PageNavigatorBloc() : super(CatListPageState());

  @override
  Stream<PageNavigatorState> mapEventToState(PageNavigatorEvent event) async* {
    if (event is PageNavigatorToCatListEvent) {
      yield CatListPageState();
    } else if (event is PageNavigatorToCatInfoEvent) {
      yield CatInfoPageState(catInfo: event.catInfo);
    }
  }
}

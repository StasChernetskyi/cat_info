import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cat_info/bloc/page_navigator/bloc.dart';
import 'package:cat_info/widget/cat_info_widget.dart';

class CatInfoPage extends StatelessWidget {
  final dynamic catInfo;

  CatInfoPage({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return _onWillPop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(catInfo.name),
          ),
          body: CatInfoWidget(catInfo: catInfo),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    BlocProvider.of<PageNavigatorBloc>(context).add(
      PageNavigatorToCatListEvent(),
    );
    return false;
  }
}

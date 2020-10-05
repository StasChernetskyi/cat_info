import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/widget/cat_list_widget.dart';

class CatListPage extends StatefulWidget {
  final List<Cat> catsInfo;

  CatListPage({@required this.catsInfo}) : assert(catsInfo.isNotEmpty);

  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cat Info"),
        ),
        body: CatListWidget(catsInfo: widget.catsInfo),
      ),
    );
  }
}

import 'package:cat_info/widget/cat_list_widget.dart';
import 'package:flutter/material.dart';

class CatListPage extends StatefulWidget {
  final List<dynamic> catsInfo;

  CatListPage({@required this.catsInfo}) : assert(catsInfo.isNotEmpty);

  @override
  _CatListPageState createState() => _CatListPageState(catsInfo: catsInfo);
}

class _CatListPageState extends State<CatListPage> {
  final List<dynamic> catsInfo;

  _CatListPageState({@required this.catsInfo}) : assert(catsInfo.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cat Info"),
        ),
        body: CatListWidget(catsInfo: catsInfo),
      ),
    );
  }
}

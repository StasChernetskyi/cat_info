import 'package:flutter/material.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/widget/cat_info_widget.dart';

class CatInfoPage extends StatelessWidget {
  final Cat catInfo;

  CatInfoPage({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(catInfo.name),
      ),
      body: CatInfoWidget(catInfo: catInfo),
    ));
  }
}

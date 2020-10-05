import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:cat_info/model/cat.dart';
import 'package:cat_info/page/pages.dart';

class CatCardWidget extends StatelessWidget {
  final Cat catInfo;

  CatCardWidget({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatInfoPage(catInfo: catInfo),
            ),
          );
        },
        child: Card(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: catInfo.imageUrl,
                    child: Image.network(
                      catInfo.imageUrl,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    catInfo.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

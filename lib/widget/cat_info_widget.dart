import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cat_info/model/cat.dart';

class CatInfoWidget extends StatelessWidget {
  final Cat catInfo;

  CatInfoWidget({@required this.catInfo}) : assert(catInfo != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildImageWidget(),
            ),
            Expanded(
              flex: 2,
              child: _buildInfoListWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoListWidget() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: Text(
              "Temperament: ${catInfo.temperament}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: Text(
              "Origin: ${catInfo.origin}",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: Text(
              "Life span: ${catInfo.lifeSpan}",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: InkWell(
              child: Text(
                "Wikipedia",
                style: TextStyle(fontSize: 18.0, color: Colors.blue),
              ),
              onTap: () => launch(catInfo.wikipediaUrl),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
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
        ],
      ),
    );
  }
}

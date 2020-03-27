import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String _imageUrl;
  final GestureTapCallback _onTap;

  PhotoItem({@required String imageUrl, @required GestureTapCallback onTap})
      : this._imageUrl = imageUrl,
        this._onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (key, constraints) => InkWell(
        onTap: this._onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 6.0,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: CachedNetworkImage(
              imageUrl: this._imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

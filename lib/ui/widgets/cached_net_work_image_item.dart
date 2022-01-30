import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachNetWorkImageItem extends StatelessWidget {
  const CachNetWorkImageItem(
      {Key? key,
      required this.heightImageNetWork,
      required this.heightImageError,
      required this.imageUrl,
      this.widthtImageNetWork})
      : super(key: key);
  final double heightImageNetWork;
  final double? widthtImageNetWork;
  final double heightImageError;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: widthtImageNetWork,
      height: heightImageNetWork,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/loading.png',
        fit: BoxFit.cover,
        height: heightImageError,
      ),
    );
  }
}

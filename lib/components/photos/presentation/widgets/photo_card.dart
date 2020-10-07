import 'package:flutter/material.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/widgets/photo_likes.dart';

class PhotoCard extends StatelessWidget {
  final Photo _photo;

  const PhotoCard(this._photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              _photo.url,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              _photo.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: PhotoLikes(_photo),
          ),
        ],
      ),
    );
  }
}

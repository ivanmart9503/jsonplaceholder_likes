import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_likes/components/photos/data/models/likes_model.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel({
    @required int albumId,
    @required int id,
    @required String title,
    @required String url,
    @required String thumbnailUrl,
  }) : super(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Sin título',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson(PhotoModel photo) {
    return {
      "albumId": photo.albumId,
      "id": photo.id,
      "title": photo.title,
      "url": photo.url,
      "thumbnailUrl": photo.thumbnailUrl
    };
  }

  factory PhotoModel.fromSuper(Photo photo) {
    return PhotoModel(
        albumId: photo.albumId,
        id: photo.id,
        title: photo.title,
        url: photo.url,
        thumbnailUrl: photo.thumbnailUrl);
  }
}

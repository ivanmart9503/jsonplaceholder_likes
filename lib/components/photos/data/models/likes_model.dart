import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';

class LikesModel extends Likes {
  LikesModel({
    @required int numberOfLikes,
    @required List<dynamic> users,
  }) : super(numberOfLikes: numberOfLikes, users: users);

  factory LikesModel.fromJson(Map<String, dynamic> json) {
    return LikesModel(
      numberOfLikes: json['numberOfLikes'] ?? 0,
      users: json['users'] ?? [],
    );
  }

  Map<String, dynamic> toJson(LikesModel photo) {
    return {
      "numberOfLikes": numberOfLikes,
      "users": users,
    };
  }

  factory LikesModel.fromSuper(Likes likes) {
    return LikesModel(
      numberOfLikes: likes.numberOfLikes,
      users: likes.users,
    );
  }
}

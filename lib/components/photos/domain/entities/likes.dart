import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Likes extends Equatable {
  final int numberOfLikes;
  final List<dynamic> users;

  Likes({@required this.numberOfLikes, @required this.users});

  @override
  List<Object> get props => [numberOfLikes, users];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Likes extends Equatable {
  final int numberOfLikes;
  final List<dynamic> usersId;

  Likes({@required this.numberOfLikes, @required this.usersId});

  @override
  List<Object> get props => [numberOfLikes, usersId];
}

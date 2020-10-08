import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  const User({
    @required this.id,
    @required this.name,
    @required this.photo,
  });

  final String id;
  final String name;
  final String photo;

  @override
  List<Object> get props => [id, name, photo];
}

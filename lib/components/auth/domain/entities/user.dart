import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  const User({
    @required this.id,
    @required this.name,
    @required this.photo,
  });

  /// Id único que viene de la autenticación con google
  final String id;

  /// El nombre del usuario
  final String name;

  /// Url de la foto de perfil
  final String photo;

  @override
  List<Object> get props => [id, name, photo];
}

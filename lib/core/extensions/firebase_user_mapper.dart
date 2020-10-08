import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';

/// Extensión que añade un método para convertir el User de Firebase
/// en usuario de la aplicación
extension FirebaseUserMapper on Firebase.User {
  User toNormalUser() {
    return User(id: uid, name: displayName, photo: photoURL);
  }
}

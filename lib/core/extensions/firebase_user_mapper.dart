import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';

extension FirebaseUserMapper on Firebase.User {
  User toNormalUser() {
    return User(id: uid, name: displayName, photo: photoURL);
  }
}

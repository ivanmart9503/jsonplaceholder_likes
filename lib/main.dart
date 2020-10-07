import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder_likes/app.dart';
import 'package:jsonplaceholder_likes/core/navigation/router.dart';
import 'package:jsonplaceholder_likes/core/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Router.generateRoutes();
  initServiceLocator();
  runApp(JsonPlaceHolderApp());
}

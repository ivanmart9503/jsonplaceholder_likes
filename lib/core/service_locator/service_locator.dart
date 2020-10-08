import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jsonplaceholder_likes/components/auth/data/repositories/repository.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/components/auth/presentation/cubit/auth_cubit.dart';
import 'package:jsonplaceholder_likes/components/photos/data/repositories/likes_repository.dart';
import 'package:jsonplaceholder_likes/components/photos/data/repositories/repository.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/cubit/photos_cubit.dart';

final getIt = GetIt.I;

/// Inicialización de inyección de dependencias
void initServiceLocator() {
  // Blocs
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(getIt<IAuthRepository>()),
  );
  getIt.registerFactory<PhotosCubit>(
    () => PhotosCubit(getIt<IPhotosRepository>()),
  );

  // Repos
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      FirebaseAuth.instance,
      GoogleSignIn(),
    ),
  );
  getIt.registerLazySingleton<IPhotosRepository>(
    () => PhotosRepository(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ILikesRepository>(() => LikesRepository());

  // ThirdParty packages
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        responseType: ResponseType.json,
        contentType: 'application/json',
        validateStatus: (status) => status <= 500,
      ),
    ),
  );
}

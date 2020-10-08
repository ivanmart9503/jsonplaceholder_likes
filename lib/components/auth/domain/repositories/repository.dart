import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';
import 'package:jsonplaceholder_likes/core/errors/failures.dart';

/// Interfaz del repositorio de autenticación y los métodos a implementar
abstract class IAuthRepository {
  Future<Option<User>> getSignedInUSer();
  Future<Either<Failure, User>> signInWithGoogle();
  Future<void> signOut();
}

import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';
import 'package:jsonplaceholder_likes/core/errors/failures.dart';

abstract class IAuthRepository {
  Future<Option<User>> getSignedInUSer();
  Future<Either<Failure, User>> signInWithGoogle();
  Future<void> signOut();
}

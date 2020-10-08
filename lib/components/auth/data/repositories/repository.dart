import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/core/errors/failures.dart';
import 'package:jsonplaceholder_likes/core/extensions/firebase_user_mapper.dart';

/// Implementación de la interfaz del repositorio de autenticación
class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(this._firebaseAuth, this._googleSignIn);

  /// Obtener el último usuario logueado,
  /// puede ser nulo
  @override
  Future<Option<User>> getSignedInUSer() async =>
      optionOf(_firebaseAuth.currentUser?.toNormalUser());

  /// Iniciar sesión en Firebase con las credenciales de Google
  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(ServerFailure('Cancelado por el usuario.'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return right(userCredential.user.toNormalUser());
    } on FirebaseAuthException catch (_) {
      return left(ServerFailure('Error desconocido.'));
    }
  }

  /// Cerrar sesión en Firebase y en Google
  @override
  Future<void> signOut() {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}

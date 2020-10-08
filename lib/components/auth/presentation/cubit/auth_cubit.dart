import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/core/extensions/firebase_user_mapper.dart';

part 'auth_state.dart';

/// Cubit o BLoC para manejar el estado de la autenticación
class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _repository;
  StreamSubscription _firebaseAuthSubscription;

  AuthCubit(this._repository) : super(AuthInitial()) {
    /// Suscripción al stream que "escucha" los cambios de autenticación
    /// "logueado" o "no logueado"
    _firebaseAuthSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      authenticationUserChanged(user?.toNormalUser());
    });
  }

  /// Emitir un estado dependiendo de si hay un usuario logueado o no
  void authenticationUserChanged(User user) {
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  /// Iniciar el proceso de login con Google
  void signInWithGoogle() async {
    emit(Authenticating());
    final result = await _repository.signInWithGoogle();
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  /// Iniciar el proceso de cerrar sesión
  void signOut() async {
    await _repository.signOut();
    emit(Unauthenticated());
  }

  /// Cancelar la suscripción al stream
  /// para evitar fugas de memoria
  @override
  Future<void> close() {
    _firebaseAuthSubscription.cancel();
    return super.close();
  }
}

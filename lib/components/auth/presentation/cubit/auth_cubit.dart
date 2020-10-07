import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:jsonplaceholder_likes/components/auth/domain/entities/user.dart';
import 'package:jsonplaceholder_likes/components/auth/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/core/extensions/firebase_user_mapper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _repository;
  StreamSubscription _firebaseAuthSubscription;

  AuthCubit(this._repository) : super(AuthInitial()) {
    _firebaseAuthSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      authenticationUserChanged(user?.toNormalUser());
    });
  }

  void authenticationUserChanged(User user) {
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  void signInWithGoogle() async {
    emit(Authenticating());
    final result = await _repository.signInWithGoogle();
    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  void signOut() async {
    await _repository.signOut();
    emit(Unauthenticated());
  }

  @override
  Future<void> close() {
    _firebaseAuthSubscription.cancel();
    return super.close();
  }
}

part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class Authenticating extends AuthState {}

class AuthenticationError extends AuthState {
  final String message;

  AuthenticationError(this.message);

  @override
  List<Object> get props => [message];
}

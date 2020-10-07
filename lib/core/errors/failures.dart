import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message) : super(message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

class FirebaseFailure extends Failure {
  final String message;

  FirebaseFailure(this.message) : super(message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

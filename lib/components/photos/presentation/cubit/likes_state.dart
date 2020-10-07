part of 'likes_cubit.dart';

abstract class LikesState extends Equatable {
  const LikesState();

  @override
  List<Object> get props => [];
}

class LikesInitial extends LikesState {}

class LikesLoadInProgress extends LikesState {}

class LikesLoadSuccess extends LikesState {}

class LikesLoadFailure extends LikesState {}

class UpdatedLikes extends LikesState {
  final Likes likes;

  UpdatedLikes(this.likes);

  @override
  List<Object> get props => [likes];
}

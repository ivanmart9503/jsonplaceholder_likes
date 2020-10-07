import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';

part 'likes_state.dart';

class LikesCubit extends Cubit<LikesState> {
  final Photo photo;
  final ILikesRepository _repository;
  StreamSubscription _likesSubscription;

  LikesCubit(this.photo, this._repository) : super(LikesInitial());

  void loadLikes() {
    _likesSubscription?.cancel();
    _likesSubscription = _repository.watch(photo.id).listen((likes) {
      emit(UpdatedLikes(likes));
    });
  }

  @override
  Future<void> close() {
    _likesSubscription.cancel();
    return super.close();
  }
}

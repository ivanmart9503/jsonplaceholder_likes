import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';

part 'likes_state.dart';

/// Cubit o BLoC para manejar el estado de likes de cada foto
class LikesCubit extends Cubit<LikesState> {
  final Photo photo;
  final ILikesRepository _repository;
  StreamSubscription _likesSubscription;

  LikesCubit(this.photo, this._repository) : super(LikesInitial());

  /// Suscripción al stream que "escucha" los cambios en los likes
  void loadLikes() {
    _likesSubscription?.cancel();
    _likesSubscription = _repository.watch(photo.id).listen((likes) {
      emit(UpdatedLikes(likes));
    });
  }

  /// Método para dar like a una foto
  void likePhoto(int photoId, String userId) async {
    await _repository.likePhoto(photoId, userId);
  }

  /// Método para dar dislike a una foto
  void dislikePhoto(int photoId, String userId) async {
    await _repository.dislikePhoto(photoId, userId);
  }

  @override
  Future<void> close() {
    _likesSubscription.cancel();
    return super.close();
  }
}

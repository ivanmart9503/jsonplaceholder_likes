import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';

abstract class ILikesRepository {
  Stream<Likes> watch(int photoId);
  Future<void> likePhoto(int photoId, String userId);
  Future<void> dislikePhoto(int photoId, String userId);
}

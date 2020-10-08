import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jsonplaceholder_likes/components/photos/data/models/likes_model.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';

class LikesRepository implements ILikesRepository {
  final _photos = FirebaseFirestore.instance.collection('photos');

  @override
  Stream<Likes> watch(int photoId) {
    return _photos.doc(photoId.toString()).snapshots().map((snapshot) {
      if (snapshot.exists) {
        final Map<String, dynamic> data = snapshot.data();
        final List<dynamic> usersId = data['likes'];
        final int likes = usersId.length;

        return LikesModel(numberOfLikes: likes, usersId: usersId);
      } else {
        return LikesModel(numberOfLikes: 0, usersId: []);
      }
    });
  }

  @override
  Future<void> likePhoto(int photoId, String userId) {
    return _photos.doc(photoId.toString()).set({
      'likes': FieldValue.arrayUnion([userId])
    }, SetOptions(merge: true));
  }

  @override
  Future<void> dislikePhoto(int photoId, String userId) {
    return _photos.doc(photoId.toString()).update({
      'likes': FieldValue.arrayRemove([userId])
    });
  }
}

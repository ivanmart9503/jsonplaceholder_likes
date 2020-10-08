import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jsonplaceholder_likes/components/photos/data/models/likes_model.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';

/// Implementación del repositorio de likes
class LikesRepository implements ILikesRepository {
  /// Referencia a la colección "photos" donde se almacenan los likes de cada foto
  final _photos = FirebaseFirestore.instance.collection('photos');

  /// Método para estar escuchando los cambios en la colección de cada foto,
  /// se hace un previo casteo de la información a LikesModel
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

  /// Método para dar like a una foto.
  /// Si la foto no existe en Firebase Store se crea junto con el like
  @override
  Future<void> likePhoto(int photoId, String userId) {
    return _photos.doc(photoId.toString()).set({
      'likes': FieldValue.arrayUnion([userId])
    }, SetOptions(merge: true));
  }

  /// Método para dar dislike a una foto
  @override
  Future<void> dislikePhoto(int photoId, String userId) {
    return _photos.doc(photoId.toString()).update({
      'likes': FieldValue.arrayRemove([userId])
    });
  }
}

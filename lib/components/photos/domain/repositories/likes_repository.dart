import 'package:jsonplaceholder_likes/components/photos/domain/entities/likes.dart';

abstract class ILikesRepository {
  Stream<Likes> watch(int photoId);
}

import 'package:dartz/dartz.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/core/errors/failures.dart';

/// Interfaz del repositorio de fotos con métodos a implementar
abstract class IPhotosRepository {
  Future<Either<Failure, List<Photo>>> getPhotos();
}

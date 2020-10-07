import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jsonplaceholder_likes/components/photos/data/models/photo_model.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/repository.dart';
import 'package:jsonplaceholder_likes/core/errors/failures.dart';

class PhotosRepository implements IPhotosRepository {
  final Dio _http;

  PhotosRepository(this._http);

  @override
  Future<Either<Failure, List<Photo>>> getPhotos() async {
    final response = await _http.get('photos');

    if (response.statusCode == 200) {
      final List<dynamic> list = response.data;
      return right(list.map((p) => PhotoModel.fromJson(p)).toList());
    } else {
      return left(
        ServerFailure(
          'Ocurrió un error al obtener las fotografías, inténtalo más tarde',
        ),
      );
    }
  }
}

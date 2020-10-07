import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/repository.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final IPhotosRepository _repository;

  PhotosCubit(this._repository) : super(PhotosInitial());

  void getPhotos() async {
    print('Obteniendo fotos');
    emit(PhotosLoadInProgress());

    final result = await _repository.getPhotos();

    result.fold(
      (failure) => emit(PhotosLoadFailure(failure.message)),
      (photos) => emit(PhotosLoadSuccess(photos)),
    );
  }
}

part of 'photos_cubit.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}

class PhotosLoadInProgress extends PhotosState {}

class PhotosLoadSuccess extends PhotosState {
  final List<Photo> photos;

  PhotosLoadSuccess(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotosLoadFailure extends PhotosState {
  final String message;

  PhotosLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_likes/components/auth/presentation/cubit/auth_cubit.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/entities/photo.dart';
import 'package:jsonplaceholder_likes/components/photos/domain/repositories/likes_repository.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/cubit/likes_cubit.dart';
import 'package:jsonplaceholder_likes/core/service_locator/service_locator.dart';

class PhotoLikes extends StatelessWidget {
  final Photo _photo;

  const PhotoLikes(this._photo);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LikesCubit>(
      create: (context) => LikesCubit(
        _photo,
        getIt<ILikesRepository>(),
      )..loadLikes(),
      child: BlocBuilder<LikesCubit, LikesState>(
        builder: (context, state) {
          if (state is LikesInitial) {
            return Container();
          } else if (state is UpdatedLikes) {
            final int likes = state.likes.numberOfLikes;
            final List<dynamic> usersId = state.likes.users;
            return Column(
              children: [
                _likeDislikeIcon(context, usersId),
                const SizedBox(height: 5),
                Text(
                  likes == 1 ? '$likes like' : '$likes likes',
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _likeDislikeIcon(BuildContext context, List<dynamic> usersId) {
    final user = (context.bloc<AuthCubit>().state as Authenticated).user;
    final like = usersId.contains(user.id);
    final icon = like ? Icons.favorite : Icons.favorite_border;
    final color = like ? Colors.red : Colors.black;

    return Icon(icon, color: color, size: 28);
  }
}

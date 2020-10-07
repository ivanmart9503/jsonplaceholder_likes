import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/cubit/photos_cubit.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/widgets/photo_card.dart';

class PhotosGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      childAspectRatio: 9 / 16,
    );
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state is PhotosLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PhotosLoadSuccess) {
          return GridView.builder(
            gridDelegate: _gridDelegate,
            padding: const EdgeInsets.only(top: 5, bottom: 80),
            itemCount: state.photos.length,
            itemBuilder: (context, i) {
              final photo = state.photos[i];
              return PhotoCard(photo);
            },
          );
        } else if (state is PhotosLoadFailure) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_likes/components/auth/presentation/cubit/auth_cubit.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/cubit/photos_cubit.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/widgets/photos_grid.dart';
import 'package:jsonplaceholder_likes/core/service_locator/service_locator.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotosCubit>(
      create: (_) => getIt<PhotosCubit>()..getPhotos(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Photos'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<AuthCubit>().signOut();
              },
            ),
          ],
        ),
        body: PhotosGrid(),
      ),
    );
  }
}

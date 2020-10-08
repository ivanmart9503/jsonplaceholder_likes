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
          backgroundColor: Colors.grey[100],
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                (context.bloc<AuthCubit>().state as Authenticated).user.photo,
              ),
            ),
          ),
          title: Text(
            '{JSON} Placeholder',
            style: TextStyle(color: Colors.black),
          ),
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

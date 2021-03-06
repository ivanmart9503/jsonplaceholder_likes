import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_likes/components/auth/presentation/cubit/auth_cubit.dart';
import 'package:jsonplaceholder_likes/core/helpers/snackbar_helper.dart';
import 'package:jsonplaceholder_likes/core/navigation/router.dart';
import 'package:jsonplaceholder_likes/core/service_locator/service_locator.dart';
import 'package:sailor/sailor.dart';

class JsonPlaceHolderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Barra de estado transparente
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return BlocProvider<AuthCubit>(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // Listener para cambios en la autenticación
          // y redireccionar dependiendo de la situación
          if (state is Authenticated) {
            Router.sailor.navigate(
              '/photos',
              navigationType: NavigationType.pushReplace,
            );
          }

          if (state is Unauthenticated) {
            Router.sailor.navigate(
              '/',
              navigationType: NavigationType.pushAndRemoveUntil,
              removeUntilPredicate: (Route<dynamic> oldRoute) => false,
            );
          }

          if (state is AuthenticationError) {
            SnackbarHelper.failureSnackbar(state.message).show(context);
          }
        },
        child: MaterialApp(
          title: 'JsonPlaceHolder Photos',
          theme: ThemeData(fontFamily: 'Overpass'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: Router.sailor.generator(),
          navigatorKey: Router.sailor.navigatorKey,
        ),
      ),
    );
  }
}

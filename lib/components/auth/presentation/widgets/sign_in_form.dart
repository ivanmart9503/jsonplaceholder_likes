import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder_likes/components/auth/presentation/cubit/auth_cubit.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          FlushbarHelper.createSuccess(
            message: 'Bienvenido ${state.user.name}',
          ).show(context);
        }
        if (state is AuthenticationError) {
          FlushbarHelper.createError(message: state.message).show(context);
        }
      },
      builder: (context, state) {
        if (state is Authenticating || state is Authenticated) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: RaisedButton.icon(
              icon: Image.asset(
                'assets/google.png',
                height: 18,
              ),
              onPressed: () {
                context.bloc<AuthCubit>().signInWithGoogle();
              },
              color: Colors.white,
              textColor: Colors.black,
              label: const Text(
                'Ingresar con Google',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

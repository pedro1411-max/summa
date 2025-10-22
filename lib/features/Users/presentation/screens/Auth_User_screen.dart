import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class AuthUserScreen extends StatelessWidget {
  AuthUserScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingUser) {
            return CircularProgressIndicator();
          }

          return Column(
            children: [
              Text("Registrate"),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: "Ingresa tu correo"),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: "Ingresa tu contraseña"),
              ),
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: "Ingresa tu nombre de usuario",
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<UserBloc>().add(
                    OnSingUpUser(
                      emailcontroller.text.trim(),
                      passwordcontroller.text.trim(),
                      namecontroller.text.trim(),
                    ),
                  );
                },

                child: const Text('Registrar'),
              ),

              Text(state.toString()),
            ],
          );
        },
      ),
    );
  }
}

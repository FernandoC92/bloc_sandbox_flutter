import 'package:bloc_sandbox/bloc/ex2/ex2.form_submission_status.dart';
import 'package:bloc_sandbox/bloc/ex2/ex2.login_bloc.dart';
import 'package:bloc_sandbox/bloc/ex2/ex2.login_event.dart';
import 'package:bloc_sandbox/bloc/ex2/ex2.login_state.dart';
import 'package:bloc_sandbox/repositories/ex2.auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ex2PageLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ex2 Login UI With BLoC'),
        ),
        body: BlocProvider(
          create: (context) =>
              Ex2LoginBloc(authRepo: context.read<AuthRepository>()),
          child: _loginForm(),
        ));
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _usernameField(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _passwordField(),
            ),
            Container(margin: EdgeInsets.only(top: 20), child: _loginBtn())
          ],
        ),
      ),
    );
  }

  // ! Através do context do BlocBuilder podemos realizar o .add (input)
  Widget _usernameField() {
    return BlocBuilder<Ex2LoginBloc, Ex2LoginState>(builder: (context, state) {
      return TextFormField(
        decoration:
            InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
        validator: (v) =>
            state.isValidusername ? null : 'Username is too short',
        onChanged: (v) =>
            context.read<Ex2LoginBloc>().add(LoginUsernameChanged(username: v)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<Ex2LoginBloc, Ex2LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration:
              InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
          validator: (v) =>
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (v) => context
              .read<Ex2LoginBloc>()
              .add(LoginPasswordChanged(password: v)),
        );
      },
    );
  }

  Widget _loginBtn() {
    return BlocBuilder<Ex2LoginBloc, Ex2LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // ! O acesso ao Ex2LoginBloc só é possível devido ao BlocProvider ancestral
                    context.read<Ex2LoginBloc>().add(LoginSubmitted());
                  }
                },
                child: Text('Login'));
      },
    );
  }
}

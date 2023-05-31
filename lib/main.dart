import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_constant/observer_bloc.dart';
import 'package:flutter_to_do/_constant/router.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_bloc.dart';
import 'package:flutter_to_do/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = ObserverBloc();
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      lazy: false,
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}

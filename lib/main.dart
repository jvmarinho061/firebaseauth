import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';
import 'package:loginflutterteste/features/auth/auth_bloc.dart';
import 'package:loginflutterteste/features/data/auth_firebase_datarsource.dart';
import 'package:loginflutterteste/features/data/auth_repository_impl.dart';
import 'package:loginflutterteste/features/pages/login_page.dart';
import 'package:loginflutterteste/features/repositories/post_repository.dart';

void main() async {
  GetIt.I.registerSingleton((DioClient()));
  GetIt.I.registerSingleton(PostRepository(GetIt.I.get()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (_) => AuthBloc(AuthRepositoryImpl(FirebaseAuth.instance, AuthFirebaseDatarsource),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login ex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginPage(),
    );
  }
}

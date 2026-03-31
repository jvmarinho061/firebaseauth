import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:loginflutterteste/core/dio/dio_client.dart';
import 'package:loginflutterteste/core/router/app_router.dart';
import 'package:loginflutterteste/features/auth/auth_bloc.dart';
import 'package:loginflutterteste/features/data/auth_firebase_datarsource.dart';
import 'package:loginflutterteste/features/data/auth_repository_impl.dart';
import 'package:loginflutterteste/features/posts/post_bloc.dart';
import 'package:loginflutterteste/features/repositories/auth_repository.dart';
import 'package:loginflutterteste/features/repositories/post_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.I.registerSingleton<DioClient>(DioClient());
  GetIt.I.registerSingleton<PostRepository>(
    PostRepository(GetIt.I.get<DioClient>()),
  );

  GetIt.I.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      FirebaseAuth.instance,
      AuthFirebaseDatarsource(),
    ),
  );
    runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(GetIt.I.get<AuthRepository>()),
        ),
        BlocProvider<PostBloc>(
          create: (_) => PostBloc(GetIt.I.get<PostRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Login ex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
    );
  }
}

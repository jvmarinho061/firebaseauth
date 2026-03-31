import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginflutterteste/features/auth/auth_bloc.dart';
import 'package:loginflutterteste/features/auth/auth_event.dart';
import 'package:loginflutterteste/features/auth/auth_state.dart';
import 'package:loginflutterteste/widgets/input.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override 
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess) {
              context.go('/feed');
            }
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
                );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'MarinPlace',
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'Billabong'),
                ),
                const SizedBox(height: 48),
            
                Input(
                  controller: emailController, 
                  hint: 'Email'),
                const SizedBox(height: 12),
            
                Input(
                  controller: passwordController,
                  hint: 'Senha',
                  obscure: true,
                ),
                const SizedBox(height: 24),
            
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                   return SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3897F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                LoginRequested(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 16,color: Colors.white),
                          selectionColor: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
            
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color(0xFF00376B)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

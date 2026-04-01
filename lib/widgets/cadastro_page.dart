import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loginflutterteste/features/auth/auth_bloc.dart';
import 'package:loginflutterteste/features/auth/auth_event.dart';
import 'package:loginflutterteste/features/auth/auth_state.dart';
import 'package:loginflutterteste/widgets/build_text_field.dart';
import 'package:loginflutterteste/widgets/custom_data_picker.dart';

import 'package:loginflutterteste/widgets/section_header.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    cpfController.dispose();
    dataNascimentoController.dispose();
    loginController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  // Validacao basica
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha';
    }
    if (value != senhaController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = senhaController.text.trim();

      context.read<AuthBloc>().add(RegisterRequested(email, password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cadastro realizado com sucesso!'))
          );
          context.go('/login');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDadosBasicos(),
                const SizedBox(height: 24),
                _buildCredenciaisAcesso(),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _register,
                  child: const Text('Cadastrar'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Já tem conta? Faça login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDadosBasicos() {
    return Column(
      children: [
        const SectionHeader(title: "Dados Básicos", icon: Icons.person),
        const SizedBox(height: 20),
        CustomTextField(
          controller: nomeController,
          label: 'Nome:',
          icon: Icons.account_circle_outlined,
          validatorMsg: 'Informe seu nome',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: emailController,
          label: 'E-mail',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validatorMsg: 'Campo obrigatório',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: cpfController,
          label: "CPF",
          icon: Icons.person_pin_outlined,
          hint: "000.000.000-00",
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          validatorMsg: "Informe seu CPF",
          onChanged: (value) => _formatCpf(value),
        ),
        const SizedBox(height: 16),
        CustomDatePicker(
          label: "Data de Nascimento",
          controller: dataNascimentoController,
          onDatePicked: (date) {
          },
        ),
      ],
    );
  }

  Widget _buildCredenciaisAcesso() {
    return Column(
      children: [
        const SectionHeader(title: "Credenciais de Acesso", icon: Icons.security),
        const SizedBox(height: 20),
        CustomTextField(
          controller: loginController,
          label: "Login",
          icon: Icons.account_circle,
          validatorMsg: "Informe seu login",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: senhaController,
          label: "Senha",
          icon: Icons.lock,
          obscureText: true,
          validatorMsg: "Senha obrigatória",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: confirmarSenhaController,
          label: "Confirmar Senha",
          icon: Icons.lock_outline,
          obscureText: true,
          validator: _validateConfirmPassword,
        ),
      ],
    );
  }

  // Opcional, pois posso usar uma biblioteca que seria mais efetivo e menos poluido
  void _formatCpf(String value) {
    String cpf = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length > 11) cpf = cpf.substring(0, 11);
    String formatted = '';
    for (int i = 0; i < cpf.length; i++) {
      if (i == 3 || i == 6) formatted += '.';
      if (i == 9) formatted += '-';
      formatted += cpf[i];
    }
    cpfController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
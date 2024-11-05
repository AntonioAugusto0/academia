import 'package:academia/controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColor.softPink,
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Campo de Email
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              // Campo de Senha
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Botão de login
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            bool success = await controller.loginUser();
                            setState(() {
                              _isLoading = false;
                            });
                            if (success) {
                              // Redireciona para a tela inicial
                              Get.offAllNamed('/home');
                            } else {
                              // Se o login falhou, mostra a mensagem de erro
                              if (controller!= null) {
                            
                              } else {
                                Get.snackbar(
                                  'Login Failed',
                                  'Invalid credentials',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            }
                          } catch (e) {
                            setState(() {
                              _isLoading = false;
                            });
                            // Em caso de erro inesperado
                            Get.snackbar(
                              'Error',
                              'An error occurred: ${e.toString()}',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 20),
              // Botão de registro
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

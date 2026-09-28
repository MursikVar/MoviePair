import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/features/auth/bloc/auth_bloc.dart';
import 'package:movie_pair/features/auth/bloc/auth_event.dart';
import 'package:movie_pair/features/auth/bloc/auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  bool _loginStatus = true;

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _submit() {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();
    final name = _userNameController.text.trim();
    if (login.isEmpty || password.isEmpty) {
      _showError('Заполните все поля');
      return;
    }

    final bloc = context.read<AuthBloc>();
    if (_loginStatus) {
      bloc.add(Login(login: login, password: password));
    } else {
      if (name.isEmpty) {
        _showError('Кажется вы забыли про свое имя)');
        return;
      }
      bloc.add(Register(login: login, password: password, userName: name));
    }
  }

  void _toogleMode() {
    setState(() {
      _loginStatus = !_loginStatus;
      _loginController.clear();
      _passwordController.clear();
      _userNameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Error) {
          _showError(state.error);
        }
        if (state is Authenticated) {
          Navigator.of(context).pushReplacementNamed('/profile');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _loginStatus ? 'С возвращением' : 'Давайте знакомиться',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _loginStatus
                        ? 'Войдите, чтобы продолжить смотреть вместе'
                        : 'Зарегистрируйтесь, чтобы начать',
                    style: TextStyle(
                      color: Color.fromRGBO(156, 163, 178, 1),
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (!_loginStatus) ...[
                          TextFormField(
                            controller: _userNameController,
                            style: TextStyle(color: Color(0xFF9ca3b2)),
                            decoration: InputDecoration(
                              hintText: 'Имя',
                              hintStyle: TextStyle(color: Color(0xFF9ca3b2)),
                              filled: true,
                              fillColor: Color(0xFF2e323c),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                        TextFormField(
                          controller: _loginController,
                          style: TextStyle(color: Color(0xFF9ca3b2)),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Color(0xFF9ca3b2)),
                            filled: true,
                            fillColor: Color(0xFF2e323c),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //TODO: правильно оформить пароль и отображение пароля
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(color: Color(0xFF9ca3b2)),
                          decoration: InputDecoration(
                            hintText: 'Пароль',
                            hintStyle: TextStyle(color: Color(0xFF9ca3b2)),
                            filled: true,
                            fillColor: Color(0xFF2e323c),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        //TODO: реализовать метод воостановления пароля
                      },
                      child: Text(
                        'Забыли пароль?',
                        style: TextStyle(
                          color: Color(0xFF6B6B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: state is Loading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFff6b6b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: state is Loading
                          ? null
                          : Text(
                              _loginStatus ? 'Войти' : 'Зарегистрироваться',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _loginStatus ? 'Нет аккаунта?' : 'Уже есть аккаунт?',
                        style: TextStyle(
                          color: Color(0xFF9ca3b2),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: _toogleMode,
                        child: Text(
                          _loginStatus ? 'Зарегистрироваться' : 'Войти',
                          style: TextStyle(
                            color: Color(0xFF9ca3b2),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_bloc.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_event.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_state.dart';
import 'package:movie_pair/features/emailVerificated/page/widget/otp_input.dart';
import 'package:movie_pair/features/profile/pages/widgets/text_style_user_info.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  String _code = '';
  Timer? _timer;
  int _secondOnTimer = 60;

  @override
  void initState() {
    context.read<VerifyEmailBloc>().add(CallSendCode());
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondOnTimer = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (_secondOnTimer == 0) {
        time.cancel();
      } else {
        setState(() {
          _secondOnTimer--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onCodeCompleted(String code) {
    setState(() {
      _code = code;
    });
  }

  void _submit() {
    if (_code.length == 6) {
      context.read<VerifyEmailBloc>().add(SendCode(code: _code));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0e1014),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Color(0xFF9ca3b2)),
        ),
        title: Text('Профиль', style: TextStyleUserInfo().discriptionText()),
      ),
      body: BlocListener<VerifyEmailBloc, VerifyEmailState>(
        listener: (context, state) {
          state.whenOrNull(
            codeSend: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('')));
            },
            verified: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('')));
              Navigator.pushReplacementNamed(context, '/prifle');
            },
          );
        },
        child: Padding(
          padding: EdgeInsetsGeometry.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Подтвердите почту',
                style: TextStyleUserInfo().userInfoText(28),
              ),
              SizedBox(height: 12),
              Text(
                'Мы отправили 6-значный код на вашу почту',
                style: TextStyleUserInfo().discriptionText(),
              ),
              SizedBox(height: 32),
              OtpInput(lenght: 6, onCompleted: _onCodeCompleted),
              SizedBox(height: 20),
              Center(
                child: _secondOnTimer > 0
                    ? Text(
                        'Отправить код повторно через ${_secondOnTimer.toString().padLeft(2, '0')},',
                        style: TextStyleUserInfo().discriptionText(),
                      )
                    : TextButton(
                        onPressed: () {
                          context.read<VerifyEmailBloc>().add(CallSendCode());
                        },
                        child: Text(
                          'Отправить код повторно',
                          style: TextStyleUserInfo().discriptionText(),
                        ),
                      ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _code.length == 6 ? _submit : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFff6b6b),
                    foregroundColor: Color(0xFF0f0f14),
                    disabledBackgroundColor: Color.fromRGBO(255, 107, 107, 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                  ),
                  child: Text(
                    'Подтвердить',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

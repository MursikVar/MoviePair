import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_event.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_state.dart';
import 'package:movie_pair/features/emailVerificated/model/verify_email_model.dart';
import 'package:movie_pair/features/emailVerificated/repos/verify_repository.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyRepository _verifyRepository;
  VerifyEmailBloc({required VerifyRepository verifyRepository})
    : _verifyRepository = verifyRepository,
      super(VerifyEmailState.initial()) {
    on<CallSendCode>((event, emit) async {
      emit(VerifyEmailState.loading());
      try {
        await _verifyRepository.callSendCode();
        emit(VerifyEmailState.codeSend());
      } catch (e) {
        emit(VerifyEmailState.error(e.toString()));
      }
    });
    on<SendCode>((event, emit) async {
      emit(VerifyEmailState.loading());
      try {
        final request = VerifyEmailModel(emailCode: event.code);
        await _verifyRepository.sendEmailCode(request);
        emit(VerifyEmailState.verified());
      } catch (e) {
        emit(VerifyEmailState.error(e.toString()));
      }
    });
    on<Reset>((event, emit) {
      emit(VerifyEmailState.initial());
    });
  }
}

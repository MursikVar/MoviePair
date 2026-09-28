import 'package:movie_pair/features/emailVerificated/model/verify_email_model.dart';
import 'package:movie_pair/features/emailVerificated/model/verify_model_response.dart';

abstract class VerifyRepository {
  Future<void> callSendCode();

  Future<VerifyModelResponse> sendEmailCode(VerifyEmailModel request);
}
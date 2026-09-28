//Кастомный обработчик ошибок

///TODO: заменить все сообщения на кастомные виджеты ошибок
import 'package:dio/dio.dart';

class ErrorHeandler implements Exception {
  final int? statusCode;
  final String message;

  ErrorHeandler({this.statusCode, required this.message});

  @override
  String toString() => 'Error: $message (status: $statusCode)';
}

ErrorHeandler? dioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return ErrorHeandler(
        message: 'Ожидание от сервера превысило наши ожидания',
      );

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      switch (statusCode) {
        case 404:
          return ErrorHeandler(
            message: 'Кажется наш сервер отдыхает вместе с разработчком :)',
            statusCode: 404,
          );
          case 401:
          return ErrorHeandler(
            message: 'Вы не авторизовались :(',
            statusCode: 401,
          );
        case 422:
          return ErrorHeandler(
            message: 'Кажется эта задача слишком сложна для меня :(',
            statusCode: 422,
          );
        case 500:
          return ErrorHeandler(
            message: 'Внутренняя ошибка сервера :(',
            statusCode: 500,
          );
        default: 
          return ErrorHeandler(
            message: 'Ошибка сервера ($statusCode) :(',
            statusCode: statusCode,
          );
      }

    case DioExceptionType.cancel:
      return ErrorHeandler(message: 'Кажется вы отменили запрос)');

    case DioExceptionType.connectionError:
      return ErrorHeandler(message: 'Проверьте подключение к сети');

    case DioExceptionType.unknown:
      return ErrorHeandler(message: '');

    case DioExceptionType.badCertificate:
      return ErrorHeandler(message: '');

    case DioExceptionType.transformTimeout:
      return ErrorHeandler(message: '');
  }
}

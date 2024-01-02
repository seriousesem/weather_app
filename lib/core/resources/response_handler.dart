import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../utils/constants.dart';
import 'data_state.dart';
import 'dio_exception_handler.dart';
import 'error_type.dart';

class ResponseHandler<T> {
  final DioExceptionHandler<T> _dioExceptionHandler;

  ResponseHandler(this._dioExceptionHandler);

  Future<DataState<T>> handleResponse(
      Future<HttpResponse> Function() request) async {
    try {
      final httpResponse = await request.call();
      final statusCode = httpResponse.response.statusCode;
      final responseBody = httpResponse.data;
      if (statusCode == HttpStatus.ok) {
        return DataSuccess(responseBody);
      } else {
        return DataError(
            httpResponse.response.statusMessage ??
                AppErrors.noInternetConnectionError,
            ErrorType.loadError);
      }
    } catch (e) {
      if (e is DioException) {
        return _dioExceptionHandler.handleDioException(e);
      } else {
        return DataError('${AppErrors.unknownError} ${e.toString()}',
            ErrorType.unknownError);
      }
    }
  }
}

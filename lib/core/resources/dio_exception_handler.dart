import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import 'data_state.dart';
import 'error_type.dart';

class DioExceptionHandler<T> {
  DataError<T> handleDioException(DioException exception) {
    if (exception.type == DioExceptionType.connectionError) {
      return const DataError(
        AppErrors.noInternetConnectionError,
        ErrorType.loadError,
      );
    } else if (exception.type == DioExceptionType.connectionTimeout) {
      return const DataError(
          AppErrors.connectionTimeoutError, ErrorType.loadError);
    } else {
      return DataError('${AppErrors.unknownError} ${exception.message}',
          ErrorType.unknownError);
    }
  }
}

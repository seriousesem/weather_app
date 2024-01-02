import 'error_type.dart';

abstract class DataState<T> {
  final T? data;
  final String? error;
  final ErrorType? errorType;

  const DataState({this.data, this.error, this.errorType});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(String error, ErrorType errorType)
      : super(error: error, errorType: errorType);
}

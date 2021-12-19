import 'package:logger/logger.dart';

const String _tag = "common_log";

class Log {
  static final Logger _logger = Logger(
    printer: PrefixPrinter(
      PrettyPrinter(stackTraceBeginIndex: 5, methodCount: 1),
    ),
  );

  static void v(dynamic message, {String? tag}) {
    _logger.v("${tag ?? _tag} :: $message");
  }

  static void d(dynamic message, {String? tag}) {
    _logger.d("${tag ?? _tag} :: $message");
  }

  static void i(dynamic message, {String? tag}) {
    _logger.i("${tag ?? _tag} :: $message");
  }

  static void w(dynamic message, {String? tag}) {
    _logger.w("${tag ?? _tag} :: $message");
  }

  static void e(dynamic message, {String? tag}) {
    _logger.e("${tag ?? _tag} :: $message");
  }

  static void wtf(dynamic message, {String? tag}) {
    _logger.wtf("${tag ?? _tag} :: $message");
  }
}

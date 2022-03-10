import 'package:logger/logger.dart';

var logger = LoggerCustom(logEnable: true);

class LoggerCustom extends Logger{
  LoggerCustom({bool logEnable = true})
      :super(
    filter: CustomLogFilter(logEnable: logEnable),
    printer: PrettyPrinter(
        methodCount: 3,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 15,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
    ),
  );

  @override
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.v(message, error,stackTrace);
  }

  @override
  void close() {
    return super.close();

  }

  @override
  void log(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    return super.log(level, message, error,stackTrace);
  }

  @override
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.wtf(message, error,stackTrace);
  }

  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.e(message, error,stackTrace);

  }

  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.w(message, error,stackTrace);

  }

  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.i(message, error,stackTrace);

  }

  @override
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    return super.d(message, error,stackTrace);

  }
}

class CustomLogFilter extends LogFilter {
  final bool logEnable;

  CustomLogFilter({this.logEnable = true});

  @override
  bool shouldLog(LogEvent event) {
    return logEnable;
  }

}
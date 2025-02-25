import 'package:logger/logger.dart';

class LoggerHelper{

static final Logger _logger = Logger(
  printer: PrettyPrinter(),
  level: Level.debug
);

static void debug(String message){
  _logger.d(message);
}
static void info(String message){
  _logger.i(message);
}
static void warnig(String message){
  _logger.w(message);
}
static void error(String message){
  _logger.e(message);
}

}
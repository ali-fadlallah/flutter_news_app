import 'package:intl/intl.dart';

class CustomUtils {
  static String formatDate(String dateTime) {
    var formatDate = DateFormat("yyyy-MM-dd").format(DateTime.parse(dateTime));
    return formatDate;
  }
}

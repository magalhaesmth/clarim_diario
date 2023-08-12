import 'package:intl/intl.dart';

class Utils {
  String formatarDataDDMMYYYY(DateTime date) {
    return DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_Br')
        .format(date)
        .toString();
  }
}

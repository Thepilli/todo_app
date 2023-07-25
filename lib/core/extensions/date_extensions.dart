import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get timeOnly => DateFormat('HH:mm').format(this);
}

import 'package:intl/intl.dart';

extension DateTimeStringExtension on String {
  String formatDateTime() {
    DateTime dateTime = DateTime.parse(this);

    final DateFormat formatter = DateFormat('MMMM dd, yyyy - hh:mm a');

    return formatter.format(dateTime);
  }
}

extension DoubleExtension on double {
  String toCelsius() {
    double celsius = this - 273.15;
    return celsius.toStringAsFixed(1);
  }
}

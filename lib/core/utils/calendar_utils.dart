import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CalendarUtils {
  static String getViewFormattedDate(BuildContext context, String? date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('d MMMM yyyy', 'id_ID');
    DateTime? temp = DateTime.tryParse(date ?? '');
    return viewFormatter.format(temp ?? DateTime.now());
  }

  static String getJustDay(BuildContext context, String? date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('EEEE', 'id_ID');
    DateTime? temp = DateTime.tryParse(date ?? '');
    return viewFormatter.format(temp ?? DateTime.now());
  }

  static String getFullViewFormat(BuildContext context, DateTime date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
    return viewFormatter.format(date);
  }

  static String getViewFormattedMonthYear(BuildContext context, String date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('MMMM yyyy', 'id_ID');
    DateTime temp = DateTime.parse(date);
    return viewFormatter.format(temp);
  }

  static String getViewFormattedHourMinutes(BuildContext context, String date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('HH:mm', 'id_ID');
    DateTime temp = DateTime.parse(date);
    return viewFormatter.format(temp);
  }

  static String getDefaultDateFormat(DateTime date) {
    final DateFormat viewFormatter = DateFormat('yyyy-MM-dd');
    return viewFormatter.format(date);
  }

  static String getDefaultDateHourFormat(DateTime date) {
    final DateFormat viewFormatter = DateFormat('yyyy-MM-dd hh:mm');
    return viewFormatter.format(date);
  }

  static String getDefaultHourFormat(DateTime date) {
    final DateFormat viewFormatter = DateFormat('HH:mm');
    return viewFormatter.format(date);
  }

  static String getViewDateFormat(BuildContext context, DateTime date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('d MMMM yyyy', 'id_ID');
    return viewFormatter.format(date);
  }

  static String getFullViewFormattedDate(BuildContext context, String date) {
    try {
      Localizations.localeOf(context);
      final DateFormat viewFormatter = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
      DateTime temp = DateTime.parse(date);
      return viewFormatter.format(temp);
    } catch (e) {
      return "-";
    }
  }

  static String getFullViewFormattedDateTime(
      BuildContext context, String date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter =
        DateFormat('EEEE, d MMMM yyyy hh:mm', 'id_ID');
    DateTime temp = DateTime.parse(date);
    return viewFormatter.format(temp);
  }

  static String getDefaultViewFormattedDateTime(
      BuildContext context, String date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('d MMMM yyyy, hh:mm', 'id_ID');
    DateTime temp = DateTime.parse(date);
    return viewFormatter.format(temp);
  }

  static String getSimpleViewFormattedDate(BuildContext context, String date) {
    Localizations.localeOf(context);
    final DateFormat viewFormatter = DateFormat('d MMM', 'id_ID');
    DateTime temp = DateTime.parse(date);
    return viewFormatter.format(temp);
  }

  static String getTimeFromInt(int hour, int minute) {
    var tempHour = '';
    var tempMinute = '';
    if (hour < 10) {
      tempHour = '0';
    }

    if (minute < 10) {
      tempMinute = '0';
    }
    return '$tempHour:$tempMinute';
  }
}

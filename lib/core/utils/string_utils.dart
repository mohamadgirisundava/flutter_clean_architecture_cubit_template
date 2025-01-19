class StringUtils {
  static bool isValidEmail(String string) {
    if (string.isEmpty) {
      return false;
    }
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  static bool isValidPhoneNumber(String string) {
    if (string.isEmpty) {
      return false;
    }
    const pattern = r'^\+?[0-9]+$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  static String getCityName(String area) {
    var city = area;
    if (city.toLowerCase().startsWith('kota')) {
      city = city.substring(5);
    } else if (city.toLowerCase().startsWith('kabupaten')) {
      city = city.substring(10);
    }
    return city;
  }

  static void checkPhone(String value, Function check, Function reset) {
    if (value.startsWith('0') && (value.length == 4 || value.length >= 10)) {
      if (StringUtils.isValidPhoneNumber(value)) {
        check();
      }
    } else if (value.startsWith('+62') &&
        (value.length == 6 || value.length >= 12)) {
      if (StringUtils.isValidPhoneNumber(value)) {
        check();
      }
    } else if (value.startsWith('62') &&
        (value.length == 5 || value.length >= 11)) {
      if (StringUtils.isValidPhoneNumber(value)) {
        check();
      }
    } else if ((value.startsWith('62') && value.length < 5) ||
        (value.startsWith('+62') && value.length < 6) ||
        (value.startsWith('0') && value.length < 4)) {
      reset();
    }
  }

  static bool checkPhoneIsComplete(String value) {
    return ((value.startsWith('0') && (value.length >= 10)) ||
        (value.startsWith('+62') && (value.length >= 12)) ||
        (value.startsWith('62') && (value.length >= 11)));
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String jsonReadableFormat() =>
      split('_').map((element) => element.toCapitalized()).join(' ');
}

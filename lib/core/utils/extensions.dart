import 'package:flutter/material.dart';

// ============================================
// BuildContext Extensions
// ============================================

extension BuildContextExtensions on BuildContext {
  /// MediaQuery 간편 접근
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// 화면 크기
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  /// Theme 간편 접근
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  /// 키보드 높이
  double get keyboardHeight => mediaQuery.viewInsets.bottom;
  bool get isKeyboardVisible => keyboardHeight > 0;

  /// Safe Area Padding
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// 다크모드 여부
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// 키보드 닫기
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// SnackBar 표시
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  /// 에러 SnackBar 표시
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.error,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// 성공 SnackBar 표시
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// ============================================
// String Extensions
// ============================================

extension StringExtensions on String {
  /// 빈 문자열 체크
  bool get isEmptyOrNull => isEmpty;
  bool get isNotEmptyOrNull => isNotEmpty;

  /// 첫 글자 대문자
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// 각 단어의 첫 글자 대문자
  String get capitalizeWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// 숫자만 추출
  String get digitsOnly => replaceAll(RegExp(r'[^0-9]'), '');

  /// 영문자만 추출
  String get lettersOnly => replaceAll(RegExp(r'[^a-zA-Z]'), '');

  /// 이메일 검증
  bool get isValidEmail {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  /// URL 검증
  bool get isValidUrl {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(this);
  }

  /// 전화번호 검증 (한국)
  bool get isValidPhone {
    final digitsOnly = this.digitsOnly;
    return (digitsOnly.length == 11 && digitsOnly.startsWith('010')) ||
        digitsOnly.length == 10;
  }

  /// null 또는 빈 문자열일 경우 대체 값 반환
  String orDefault(String defaultValue) {
    return isEmpty ? defaultValue : this;
  }

  /// 문자열 자르기 (말줄임표 추가)
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}

// ============================================
// DateTime Extensions
// ============================================

extension DateTimeExtensions on DateTime {
  /// 오늘인지 체크
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// 어제인지 체크
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// 이번 주인지 체크
  bool get isThisWeek {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));
    return isAfter(weekStart) && isBefore(weekEnd);
  }

  /// 이번 달인지 체크
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// 이번 년도인지 체크
  bool get isThisYear {
    final now = DateTime.now();
    return year == now.year;
  }

  /// 시작 시간 (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// 종료 시간 (23:59:59)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// n일 더하기
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// n일 빼기
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// 같은 날짜인지 체크
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

// ============================================
// num Extensions
// ============================================

extension NumExtensions on num {
  /// Duration으로 변환
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());

  /// 범위 체크
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }

  /// 퍼센트로 변환
  double toPercent(num total) {
    if (total == 0) return 0;
    return (this / total) * 100;
  }
}

// ============================================
// List Extensions
// ============================================

extension ListExtensions<T> on List<T> {
  /// 안전한 인덱스 접근
  T? getOrNull(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }

  /// 리스트를 청크로 분할
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}

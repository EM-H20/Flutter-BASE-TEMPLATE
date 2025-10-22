import 'package:intl/intl.dart';

/// 공통 포맷팅 유틸리티
/// 날짜, 숫자, 통화 등의 포맷팅
class Formatters {
  Formatters._();

  // ============================================
  // 날짜 포맷팅
  // ============================================

  /// 날짜를 "yyyy-MM-dd" 형식으로 포맷
  static String date(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// 날짜를 "yyyy년 MM월 dd일" 형식으로 포맷
  static String dateKorean(DateTime date) {
    return DateFormat('yyyy년 MM월 dd일').format(date);
  }

  /// 날짜를 "MM/dd" 형식으로 포맷
  static String dateShort(DateTime date) {
    return DateFormat('MM/dd').format(date);
  }

  /// 날짜를 "yyyy-MM-dd HH:mm" 형식으로 포맷
  static String dateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  /// 날짜를 "yyyy년 MM월 dd일 HH:mm" 형식으로 포맷
  static String dateTimeKorean(DateTime dateTime) {
    return DateFormat('yyyy년 MM월 dd일 HH:mm').format(dateTime);
  }

  /// 시간을 "HH:mm" 형식으로 포맷
  static String time(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// 시간을 "HH:mm:ss" 형식으로 포맷
  static String timeWithSeconds(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  /// 상대 시간 표시 (방금 전, n분 전, n시간 전 등)
  static String relativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}일 전';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks주 전';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months개월 전';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years년 전';
    }
  }

  // ============================================
  // 숫자 포맷팅
  // ============================================

  /// 숫자를 천 단위 콤마로 포맷
  static String number(num number) {
    return NumberFormat('#,###').format(number);
  }

  /// 숫자를 소수점 포함 포맷
  static String decimal(num number, {int decimalDigits = 2}) {
    return NumberFormat('#,##0.${'0' * decimalDigits}').format(number);
  }

  /// 숫자를 퍼센트로 포맷
  static String percent(num number, {int decimalDigits = 0}) {
    return NumberFormat('0.${'0' * decimalDigits}%').format(number);
  }

  /// 숫자를 축약 형태로 포맷 (1K, 1M, 1B)
  static String compact(num number) {
    return NumberFormat.compact(locale: 'ko_KR').format(number);
  }

  // ============================================
  // 통화 포맷팅
  // ============================================

  /// 한국 원화 포맷
  static String won(num amount) {
    return '${NumberFormat('#,###').format(amount)}원';
  }

  /// 달러 포맷
  static String dollar(num amount) {
    return '\$${NumberFormat('#,##0.00').format(amount)}';
  }

  /// 통화 기호 없이 금액만 포맷
  static String currency(num amount) {
    return NumberFormat('#,###').format(amount);
  }

  // ============================================
  // 전화번호 포맷팅
  // ============================================

  /// 전화번호를 "010-1234-5678" 형식으로 포맷
  static String phone(String phoneNumber) {
    // 숫자만 추출
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length == 11) {
      // 010-1234-5678
      return '${digitsOnly.substring(0, 3)}-${digitsOnly.substring(3, 7)}-${digitsOnly.substring(7)}';
    } else if (digitsOnly.length == 10) {
      // 02-1234-5678
      return '${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 6)}-${digitsOnly.substring(6)}';
    } else {
      return phoneNumber;
    }
  }

  // ============================================
  // 파일 크기 포맷팅
  // ============================================

  /// 파일 크기를 KB, MB, GB 단위로 포맷
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  // ============================================
  // 카드 번호 포맷팅
  // ============================================

  /// 카드 번호를 "1234-5678-9012-3456" 형식으로 포맷
  static String cardNumber(String cardNumber) {
    final digitsOnly = cardNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length == 16) {
      return '${digitsOnly.substring(0, 4)}-${digitsOnly.substring(4, 8)}-${digitsOnly.substring(8, 12)}-${digitsOnly.substring(12)}';
    }

    return cardNumber;
  }

  /// 카드 번호 마스킹 (마지막 4자리만 표시)
  static String cardNumberMasked(String cardNumber) {
    final digitsOnly = cardNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length == 16) {
      return '****-****-****-${digitsOnly.substring(12)}';
    }

    return cardNumber;
  }
}

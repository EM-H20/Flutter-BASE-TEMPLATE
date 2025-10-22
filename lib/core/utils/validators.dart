/// 공통 검증 유틸리티
/// 이메일, 비밀번호, 전화번호 등 폼 검증
class Validators {
  Validators._();

  /// 이메일 검증
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }

    return null;
  }

  /// 비밀번호 검증 (최소 8자, 영문+숫자 조합)
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다';
    }

    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);

    if (!hasLetter || !hasNumber) {
      return '영문과 숫자를 조합해주세요';
    }

    return null;
  }

  /// 강한 비밀번호 검증 (최소 8자, 영문+숫자+특수문자)
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다';
    }

    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasLetter || !hasNumber || !hasSpecialChar) {
      return '영문, 숫자, 특수문자를 조합해주세요';
    }

    return null;
  }

  /// 비밀번호 확인 검증
  static String? passwordConfirm(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return '비밀번호 확인을 입력해주세요';
    }

    if (value != password) {
      return '비밀번호가 일치하지 않습니다';
    }

    return null;
  }

  /// 전화번호 검증 (한국 번호: 010-1234-5678)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return '전화번호를 입력해주세요';
    }

    // 숫자만 추출
    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.length != 11 && digitsOnly.length != 10) {
      return '올바른 전화번호 형식이 아닙니다';
    }

    if (digitsOnly.length == 11 && !digitsOnly.startsWith('010')) {
      return '올바른 전화번호 형식이 아닙니다';
    }

    return null;
  }

  /// 이름 검증 (2자 이상)
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해주세요';
    }

    if (value.length < 2) {
      return '이름은 2자 이상이어야 합니다';
    }

    return null;
  }

  /// 필수 입력 검증
  static String? required(String? value, {String fieldName = '필드'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName를 입력해주세요';
    }
    return null;
  }

  /// 최소 길이 검증
  static String? minLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return '값을 입력해주세요';
    }

    if (value.length < minLength) {
      return '최소 $minLength자 이상 입력해주세요';
    }

    return null;
  }

  /// 최대 길이 검증
  static String? maxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return '최대 $maxLength자까지 입력 가능합니다';
    }

    return null;
  }

  /// 숫자만 검증
  static String? numeric(String? value) {
    if (value == null || value.isEmpty) {
      return '숫자를 입력해주세요';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '숫자만 입력 가능합니다';
    }

    return null;
  }

  /// URL 검증
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL을 입력해주세요';
    }

    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return '올바른 URL 형식이 아닙니다';
    }

    return null;
  }

  /// 여러 검증 조합
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}

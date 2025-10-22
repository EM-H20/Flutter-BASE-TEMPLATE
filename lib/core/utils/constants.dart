/// 앱 전역 상수 관리
class AppConstants {
  AppConstants._();

  // ============================================
  // 앱 정보
  // ============================================

  static const String appName = 'Base Template';
  static const String appVersion = '1.0.0';

  // ============================================
  // API 관련
  // ============================================

  /// API Base URL (환경별로 변경)
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );

  /// API 타임아웃 (초)
  static const int apiTimeout = 30;

  /// 페이지당 아이템 수
  static const int pageSize = 20;

  // ============================================
  // 로컬 스토리지 키
  // ============================================

  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyOnboardingCompleted = 'onboarding_completed';

  // ============================================
  // 정규식 패턴
  // ============================================

  /// 이메일 정규식
  static final RegExp emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// 전화번호 정규식 (한국)
  static final RegExp phonePattern = RegExp(
    r'^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$',
  );

  /// URL 정규식
  static final RegExp urlPattern = RegExp(
    r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
  );

  // ============================================
  // 에러 메시지
  // ============================================

  static const String errorNetwork = '네트워크 연결을 확인해주세요';
  static const String errorServer = '서버 오류가 발생했습니다';
  static const String errorTimeout = '요청 시간이 초과되었습니다';
  static const String errorUnknown = '알 수 없는 오류가 발생했습니다';
  static const String errorInvalidInput = '입력값이 올바르지 않습니다';

  // ============================================
  // 애니메이션 지속 시간
  // ============================================

  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ============================================
  // Debounce/Throttle 시간
  // ============================================

  static const Duration searchDebounce = Duration(milliseconds: 500);
  static const Duration buttonThrottle = Duration(milliseconds: 1000);

  // ============================================
  // 파일 업로드 제한
  // ============================================

  /// 이미지 최대 크기 (5MB)
  static const int maxImageSize = 5 * 1024 * 1024;

  /// 동영상 최대 크기 (50MB)
  static const int maxVideoSize = 50 * 1024 * 1024;

  /// 허용 이미지 확장자
  static const List<String> allowedImageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
  ];

  // ============================================
  // 외부 링크
  // ============================================

  static const String termsOfServiceUrl = 'https://example.com/terms';
  static const String privacyPolicyUrl = 'https://example.com/privacy';
  static const String supportEmail = 'support@example.com';

  // ============================================
  // Feature Flags (개발/운영 분기)
  // ============================================

  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: false,
  );

  static const bool enableCrashlytics = bool.fromEnvironment(
    'ENABLE_CRASHLYTICS',
    defaultValue: false,
  );

  static const bool enableDebugMode = bool.fromEnvironment(
    'DEBUG_MODE',
    defaultValue: false,
  );
}

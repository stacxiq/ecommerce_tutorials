import 'dart:convert';

class ApiError {
  String message;
  String status_code;
  ApiError({
    required this.message,
    required this.status_code,
  });
  

  ApiError copyWith({
    String? message,
    String? status_code,
  }) {
    return ApiError(
      message: message ?? this.message,
      status_code: status_code ?? this.status_code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'status_code': status_code,
    };
  }

  factory ApiError.fromMap(Map<String, dynamic> map) {
    return ApiError(
      message: map['message'] ?? '',
      status_code: map['status_code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiError.fromJson(String source) => ApiError.fromMap(json.decode(source));

  @override
  String toString() => 'ApiError(message: $message, status_code: $status_code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ApiError &&
      other.message == message &&
      other.status_code == status_code;
  }

  @override
  int get hashCode => message.hashCode ^ status_code.hashCode;
}

// lib/models/user_model.dart
class UserModel {
  final String? id;
  final String email;
  final String? name;
  final String? profileImage;
  final DateTime? createdAt;
  final bool isEmailVerified;
  final String? phoneNumber;

  UserModel({
    this.id,
    required this.email,
    this.name,
    this.profileImage,
    this.createdAt,
    this.isEmailVerified = false,
    this.phoneNumber,
  });

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      profileImage: json['profile_image'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
      isEmailVerified: json['is_email_verified'] ?? false,
      phoneNumber: json['phone_number'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profile_image': profileImage,
      'created_at': createdAt?.toIso8601String(),
      'is_email_verified': isEmailVerified,
      'phone_number': phoneNumber,
    };
  }

  // Copy with
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImage,
    DateTime? createdAt,
    bool? isEmailVerified,
    String? phoneNumber,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, isEmailVerified: $isEmailVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.profileImage == profileImage &&
        other.createdAt == createdAt &&
        other.isEmailVerified == isEmailVerified &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        profileImage.hashCode ^
        createdAt.hashCode ^
        isEmailVerified.hashCode ^
        phoneNumber.hashCode;
  }
}
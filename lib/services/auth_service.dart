// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';


class AuthService {
  static const String baseUrl = ApiConstants.baseUrl;

  // Login with email and password
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'token': data['token'],
          'message': data['message'] ?? 'Login successful',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Login failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Register new user
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
          'name': name,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'token': data['token'],
          'message': data['message'] ?? 'Registration successful',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Registration failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Forgot password
  Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/forgot-password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': data['message'] ?? 'Password reset link sent',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Failed to send reset link',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Google Sign In
  Future<Map<String, dynamic>> googleSignIn({
    required String idToken,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/google'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'id_token': idToken,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'token': data['token'],
          'message': data['message'] ?? 'Google sign in successful',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Google sign in failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Facebook Sign In
  Future<Map<String, dynamic>> facebookSignIn({
    required String accessToken,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/facebook'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'access_token': accessToken,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'token': data['token'],
          'message': data['message'] ?? 'Facebook sign in successful',
        };
      } else {
        return {
          'success': false,
          'message': data['message'] ?? 'Facebook sign in failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Logout
  Future<Map<String, dynamic>> logout({
    required String token,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Logout successful',
        };
      } else {
        return {
          'success': false,
          'message': 'Logout failed',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }

  // Verify token
  Future<Map<String, dynamic>> verifyToken({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/auth/verify'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'user': UserModel.fromJson(data['user']),
          'message': 'Token valid',
        };
      } else {
        return {
          'success': false,
          'message': 'Token invalid',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error. Please check your connection.',
      };
    }
  }
}

// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://api.fanradar.com'; // Remplacez par votre URL d'API
  static const String apiVersion = 'v1';
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/auth/forgot-password';
  static const String googleAuth = '/auth/google';
  static const String facebookAuth = '/auth/facebook';
  static const String verifyToken = '/auth/verify';
  
  // Request timeout
  static const Duration requestTimeout = Duration(seconds: 30);
  
  // Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
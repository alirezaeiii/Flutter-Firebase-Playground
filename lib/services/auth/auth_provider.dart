import 'package:dart/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> sendVerificationEmail();

  Future<void> sendPasswordReset({required String toEmail});
}

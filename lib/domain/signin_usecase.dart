import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingolearn/data/services/auth_service.dart';

class SigninUseCase {
  final AuthService _authService;

  SigninUseCase(this._authService);

  Future<UserCredential> execute(String email, String password) async {
    return await _authService.signIn(email, password);
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingolearn/data/services/auth_service.dart';

class SignupUseCase {
  final AuthService _authService;

  SignupUseCase(this._authService);

  Future<void> execute(String name, String email, String password) async {
    UserCredential userCredential = await _authService.signUp(email, password);
    await _authService.storeUserData(userCredential.user!.uid, name, email);
  }
}
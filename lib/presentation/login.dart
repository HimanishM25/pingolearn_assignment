import 'package:flutter/material.dart';
import 'package:pingolearn/presentation/signup.dart';
import 'package:pingolearn/presentation/widgets/common_button.dart';
import 'package:pingolearn/presentation/widgets/common_text_field.dart';
import 'package:pingolearn/data/services/auth_service.dart';
import 'package:pingolearn/domain/signin_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/data/providers/auth_provider.dart';
import 'home.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SigninUseCase _signinUseCase = SigninUseCase(AuthService());

  Future<void> _signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await _signinUseCase.execute(
        emailController.text,
        passwordController.text,
      );
      Provider.of<AP>(context, listen: false).updateUserState();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Sign-in failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xff0C54BE),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 48.0),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.grey[600]!,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomTextField(
                  hintText: 'Enter email address',
                  controller: emailController,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.grey[600]!,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomTextField(
                  hintText: 'Enter Password',
                  isPassword: true,
                  controller: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CommonButton(
                textColor: Colors.white,
                buttonColor: Color(0xff0C54BE),
                buttonText: 'Login',
                onClick: () => _signIn(context),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New here? ',
                  style: TextStyle(
                    color: Color(0xff303F60),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xff0C54BE),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
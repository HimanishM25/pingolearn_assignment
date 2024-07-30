import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingolearn/data/services/auth_service.dart';

class AP with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  AP() {
    updateUserState();
  }

  User? get user => _user;

  Future<void> updateUserState() async {
    _user = _authService.currentUser();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
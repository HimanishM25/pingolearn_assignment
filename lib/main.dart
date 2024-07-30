import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/presentation/login.dart';
import 'package:pingolearn/presentation/home.dart';
import 'package:pingolearn/presentation/theme/theme_data.dart';
import 'package:pingolearn/data/providers/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AP(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AP>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: light_theme,
          darkTheme: dark_theme,
          home: authProvider.user == null ? SigninScreen() : Home(),
        );
      },
    );
  }
}
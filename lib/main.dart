import 'package:chatt/firebase_options.dart';
import 'package:chatt/pages/chat_page.dart';
import 'package:chatt/pages/login_page.dart';
import 'package:chatt/pages/signUp_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: 'loginPage',
    );
  }
}

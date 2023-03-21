import 'package:flutter/material.dart';
// Pages which app can open with
import 'authenticate/login.dart';
import 'package:plantify/home_page.dart';
// Firebase libraries/options
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GetLandingPage());
}

class GetLandingPage extends StatefulWidget {
  const GetLandingPage({super.key});

  @override
  State<GetLandingPage> createState() => _GetLandingPageState();
}

class _GetLandingPageState extends State<GetLandingPage> {
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const MaterialApp(home: Login());
          } else {
            return const MaterialApp(home: HomePage());
          }
        });
  }
}

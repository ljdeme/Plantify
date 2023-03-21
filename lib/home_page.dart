import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantify/authenticate/login.dart';
import 'package:plantify/widgets/widgets.dart';
import 'package:plantify/authenticate/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authentication authInstance = Authentication();
  Icon searchIcon = const Icon(Icons.search);
  Widget searchBar = const Text('search');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: searchBar,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: searchIcon,
            )
          ],
          centerTitle: true,
        ),
        body: Column(children: [
          GreenButton(
              text: 'sign out',
              onPressed: () {
                FirebaseAuth.instance.signOut;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
                //authInstance.logout();
              }),
        ]));
  }
}

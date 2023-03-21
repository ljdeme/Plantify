import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantify/main.dart';
import 'package:plantify/widgets/widgets.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  _NewUser createState() => _NewUser();
}

class _NewUser extends State<NewUser> {
  final TextEditingController _bioController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New User Information')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _bioController,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'bio',
                      hintText: 'tell us something about yourself'),
                  keyboardType: TextInputType.text,
                )),
            GreenButton(
                text: 'enter',
                onPressed: () {
                  db
                      .collection('users')
                      .doc(_firebaseAuth.currentUser?.uid)
                      .update({"bio": _bioController.text});
                })
          ],
        ),
      ),
    );
  }
}

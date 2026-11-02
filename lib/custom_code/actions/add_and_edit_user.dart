// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> addAndEditUser(
  String emailNewUser,
  String passwordCode,
  String messageInvalidEmail,
  String messageWeakPassword,
  String messageEmailAlreadyInUse,
  DocumentReference genderRef,
) async {
  String returnSignUp = "valid";

  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailNewUser, password: passwordCode);

    final myUser = userCredential.user;

    myUser!.updateDisplayName("John Smith");
    myUser.updateEmail(emailNewUser);

    // set custom fields
    final user = FirebaseFirestore.instance.collection('users').doc(myUser.uid);
    user.set({
      'created_time': Timestamp.now(),
      'email': emailNewUser,
      'uid': myUser.uid,
      'isActive': true,
      'isComplete': false,
      'isAdmin': false,
      'isNyaUser': false,
      'Newsletters': false,
      'gender': genderRef,
      'justCompletedAppointment': false,
    });
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-email':
        returnSignUp = messageInvalidEmail;
        break;
      case 'weak-password':
        returnSignUp = messageWeakPassword;
        break;
      case 'email-already-in-use':
        returnSignUp = messageEmailAlreadyInUse;
        break;
    }
  }
  return returnSignUp;
}

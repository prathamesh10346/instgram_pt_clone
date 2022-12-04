import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instgram_pt_clone/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        String photourl = await StorageMethods()
            .uploudImageToStorage("profilePics", file, false);

        // print(cred.user.displayName)

        _firestore.collection("users").doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'follower': [],
          'following': [],
          'photourl': photourl,
        });

        // await _firestore.collection('users').add({ 'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'follower': [],
        //   'following': [],});
        res = "success";
        ;
      }
    }
    // }on FirebaseAuthException catch(err){
    //   if(err.code=='invalid-email'){
    //     res='The email is badly formatted.';
    //   }else
    //     if()
    // }
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}

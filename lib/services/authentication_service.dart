import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thriftnstash/models/users.dart' as usermodel;
import 'package:thriftnstash/services/storage_services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get User details
  Future<usermodel.UserModel> getUserDetails() async {
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
    return usermodel.UserModel.fromSnap(snap);
  }

  // Stream<List<UserModel>> getUserList() {
  //   return _firestore
  //       .collection('users')
  //       .snapshots()
  //       .map((snashot) => snashot
  //       .map((docs) => usermodel.UserModel))
  //       .toList();
  // }

  // static FirebaseAuth _auth = FirebaseAuth.instance;
  // sign in anon
  static Future signInAnon() async {
    try {
      return User;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up with email password
  // change to User? if storing to result and remuve {from the static}
  static Future signUp({
    required String email,
    required String password,
    required String userFullName,
    required String userPhoneNumber,
    required File file,
  }) async {
    try {
      // UserCredential result = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);
      // User? user = result.user;
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(cred.user!.uid);
      String userPhotoURL =
          await StorageService().userProfileImage('userProfile', file, false);
      // User Models
      usermodel.UserModel usermod = usermodel.UserModel(
          uid: cred.user!.uid,
          userFullName: userFullName,
          email: email,
          userPhoneNumber: userPhoneNumber,
          userPhotoURL: userPhotoURL);
      // User model to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set(usermod.toJson());

      return 'Register Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email already regsitered';
      } else if (e.code == 'invalid-email') {
        return 'Email invalid';
      }
      return e.message;

      // add return null after print
    } catch (e) {
      print(e.toString());
      // return null
    }
  }

  static Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      // UserCredential result = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // User? user = result.user;
      // return user;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Login Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'User email not found';
      } else if (e.code == 'wrong-password') {
        return 'Password invalid';
      } else if (e.code == 'invalid-email') {
        return 'Email invalid';
      } else {
        return e.message;
      }
    } catch (e) {
      print(e.toString());
      // return null;
    }
  }

  static Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'Signed Out';
    } catch (e) {
      print(e.toString());
    }
  }

  static Stream<User?> get firebaseUserStream =>
      FirebaseAuth.instance.authStateChanges();
}

  // static Future signUpStore(
  //     {required String email, required String password}) async {
  //   try {
  //     // UserCredential result = await _auth.createUserWithEmailAndPassword(
  //     //     email: email, password: password);
  //     // User? user = result.user;
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     await DatabaseService(uid: user!.uid)
  //         .userData('firstName', 'lastName', 'product');
  //     return 'Register Success';
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       return 'Email already regsitered';
  //     } else if (e.code == 'invalid-email') {
  //       return 'Email invalid';
  //     }
  //     return e.message;
  //     // add return null after print
  //   } catch (e) {
  //     print(e.toString());
  //     // return null
  //   }
  // }

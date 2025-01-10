import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final userID = FirebaseAuth.instance.currentUser!.uid;
final FirebaseStorage _storage = FirebaseStorage.instance;
final productPath = FirebaseFirestore.instance.collection('products').id;

class StorageService {
  Future<String> userProductImage(
      String childName, File file, bool ispost) async {
    Reference ref = _storage.ref().child(
        "$childName/$userID/$productPath${DateTime.timestamp().toString()}");
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> userProfileImage(
      String childName, File file, bool ispost) async {
    Reference ref = _storage.ref().child("$childName/$userID");
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snap = await uploadTask; 
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  // Future<String> userProfileImage(
  //     String childName, File file, bool ispost) async {
  //   Reference ref =
  //       _storage.ref().child(childName).child(_auth.currentUser!.uid);
  //   UploadTask uploadTask = ref.putFile(file);
  //   TaskSnapshot snap = await uploadTask;
  //   String downloadURL = await snap.ref.getDownloadURL();
  //   return downloadURL;
  // }
}

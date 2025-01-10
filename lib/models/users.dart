import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String userFullName;
  final String email;
  final String userPhoneNumber;
  final String userPhotoURL;

  UserModel({
    required this.uid,
    required this.userFullName,
    required this.email,
    required this.userPhoneNumber,
    required this.userPhotoURL,
  });

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        uid: snap.id,
        userFullName: snapshot['userFullName'],
        email: snapshot['email'],
        userPhoneNumber: snapshot['phoneNumber'],
        userPhotoURL: snapshot['userPhotoURL']);
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "userFullName": userFullName,
        "email": email,
        "phoneNumber": userPhoneNumber,
        "userPhotoURL": userPhotoURL,
      };
}

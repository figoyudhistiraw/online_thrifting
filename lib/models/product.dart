import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModels {
  // For Cards
  final String? productID;
  final String? uid;
  final String title;
  final String description;
  final String location;
  final String price;
  final String? userPhoneNumber;
  final DateTime? dateTime;
  final String photoUrl;

  ProductModels(
      {this.productID,
       this.uid,
      required this.title,
      required this.description,
      required this.location,
      required this.price,
       this.userPhoneNumber,
       this.dateTime,
      required this.photoUrl});
  // For Details

  static ProductModels fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return ProductModels(
      productID: snapshot['productID'],
      uid: snapshot['uid'],
      title: snapshot['title'],
      description: snapshot['description'],
      location: snapshot['location'],
      price: snapshot['price'],
      userPhoneNumber: snapshot['userPhoneNumber'],
      dateTime: snapshot['dateTime'].toDate(),
      photoUrl: snapshot['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "productID": productID,
        "uid": uid,
        "title": title,
        "description": description,
        "location": location,
        "price": price,
        "userPhoneNumber": userPhoneNumber,
        "dateTime": dateTime,
        "photoUrl": photoUrl,
      };
  // static Product fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   Product product = Product(
  //       title: snapshot['title'],
  //       description: snapshot['description'],
  //       location: snapshot['location'],
  //       price: snapshot['price']);
  //   return product;
  // }
}

// class ProductDetailModels {
//   final String productID;
//   final String uid;
//   final String title;
//   final String description;
//   final String location;
//   final String price;
//   final DateTime dateTime;
//   final String photoUrl;

//   ProductDetailModels({
//     required this.productID,
//     required this.uid,
//     required this.title,
//     required this.description,
//     required this.location,
//     required this.price,
//     required this.dateTime,
//     required this.photoUrl,
//   });

//   ProductDetailModels toProductDetailModels() {
//     return ProductDetailModels(
//       productID: productID,
//       uid: uid,
//       title: title,
//       description: description,
//       location: location,
//       price: price,
//       dateTime: dateTime,
//       photoUrl: photoUrl,
//     );
//   }
// }
// // class Users {
// //   final String id;
// //   final String email;
// //   final String
// // }
// }

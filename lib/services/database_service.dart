import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thriftnstash/models/product.dart' as productmodels;
import 'package:thriftnstash/models/product.dart';
import 'package:thriftnstash/models/users.dart' as usermodels;
import 'package:thriftnstash/services/storage_services.dart';

final db = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class DatabaseService {
  Future addProduct(String title, String description, String location,
      String price, File file) async {
    {
      // Passing Phone Number property from User Models to Product Models
      usermodels.UserModel userModel = usermodels.UserModel.fromSnap(
          await FirebaseFirestore.instance
              .collection('users')
              .doc(_auth.currentUser!.uid)
              .get());
      // Assign Firebase Storage path for product image
      String photoURL =
          await StorageService().userProductImage('userProduct', file, false);
      try {
        productmodels.ProductModels prdmod = productmodels.ProductModels(
            uid: _auth.currentUser!.uid,
            title: title,
            description: description,
            location: location,
            price: price,
            userPhoneNumber: userModel.userPhoneNumber,
            dateTime: DateTime.timestamp(),
            photoUrl: photoURL);

        // Processing the property above to Firebase
        final docRef = await db.collection('products').add(prdmod.toJson());

        // Dapatkan product ID yang dihasilkan
        String productId = docRef.id;

        // Perbarui dokumen dengan product ID yang dihasilkan
        await docRef.update({'productID': productId});
        return 'Post Added';
      } catch (e) {
        return e.toString();
      }
    }
  }

  // Get Product Details
  Future<List<productmodels.ProductModels>> getProductDetails() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .orderBy('title', descending: false)
        .get();

    List<productmodels.ProductModels> products = [];
    querySnapshot.docs.forEach((documentSnapshot) {
      products.add(productmodels.ProductModels.fromSnap(documentSnapshot));
    });
    return products;

    // DocumentSnapshot snap = await _firestore
    //     .collection('products')
    //     .doc(_auth.currentUser!.uid)
    //     .get();
    // return productmodels.ProductModels.fromSnap(snap);
  }

  Future<void> updateUserData(
      String userFullName, String userPhoneNumber) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({
        'userFullName': userFullName,
        'phoneNumber': userPhoneNumber,
      }).then((value) => print("Success"), onError: (e) => print("Error $e"));
    } catch (e) {
      print('Error updating user data: $e');
      throw e;
    }
  }

  // Search Query
  Future<List<productmodels.ProductModels>> searchProducts(
      String keyword) async {
    List<productmodels.ProductModels> products = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('title'.toLowerCase(), isGreaterThanOrEqualTo: keyword)
          .get();

      querySnapshot.docs.forEach((documentSnapshot) {
        products.add(productmodels.ProductModels.fromSnap(documentSnapshot));
      });

      return products;
    } catch (e) {
      print('Error searching products: $e');
      throw e;
    }
  }

  Future<void> updateProduct(ProductModels product) async {
    try {
      await db
          .collection('products')
          .doc(product.productID)
          .update(product.toJson());
    } catch (e) {
      print('Error updating product: $e');
      // Handle error jika diperlukan
    }
  }
  // Update Products
  // Future<void> updateProduct(DocumentSnapshot snapshot) async {
  //   try {
  //     String photoURL =
  //         await StorageService().userProductImage('userProduct', file, false);
  //     await FirebaseFirestore.instance
  //         .collection('products')
  //         .doc()
  //         .update({
  //       'title': title,
  //       'description': description,
  //       'location': location,
  //       'price': price,
  //       'photoUrl': photoURL,
  //       'dateTime': DateTime.timestamp(),
  //     }).then((value) => print("Success"), onError: (e) => print("Error $e"));
  //   } catch (e) {
  //     print('Error updating user data: $e');
  //     throw e;
  //   }
  // }

  // Future<void> updateProduct(DocumentReference doc, File file) async {
  //   try {
  //     // Mengambil dokumen terkait dengan DocumentReference
  //     DocumentSnapshot docSnapshot = await doc.get();

  //     // Mendapatkan data dari dokumen
  //     String title = docSnapshot['title'];
  //     String description = docSnapshot['description'];
  //     String location = docSnapshot['location'];
  //     String price = docSnapshot['price'];

  //     // Mengambil URL foto baru
  //     String photoURL =
  //         await StorageService().userProductImage('userProduct', file, false);

  //     // Mengupdate dokumen dengan productID yang diberikan
  //     await FirebaseFirestore.instance
  //         .collection('products')
  //         .doc(doc.id)
  //         .update({
  //       'title': title,
  //       'description': description,
  //       'location': location,
  //       'price': price,
  //       'photoUrl': photoURL,
  //       'dateTime': DateTime.now(),
  //     }).then((value) => print("Success"), onError: (e) => print("Error $e"));
  //   } catch (e) {
  //     print('Error updating user data: $e');
  //     throw e;
  //   }
  // }

  // Delete product
  // Future<void> deleteProduct(DocumentSnapshot doc) async {
  //   await db.collection("products").doc(doc.id).delete();
  // }

  Future<void> deleteProduct(ProductModels product) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(product.productID)
          .delete();
      // Hapus juga gambar produk dari penyimpanan jika perlu
      // await StorageService().deleteProductImage(product.photoUrl);
      print("Product deleted");
    } catch (e) {
      print('Error deleting product: $e');
      throw e;
    }
  }
}
// Future <String?> getUserData() async {
//   DocumentSnapshot userSnap = await FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get();
//   return null;

// }

// Future<void> editProduct(String id, String title, String description,
//     String location, String price) async {
//   await db.collection('products').doc(id).update({
//     'title': title,
//     'description': description,
//     'location': location,
//     'price': price,
//   });
// }

// Future<void> deleteProduct(DocumentSnapshot doc) async {
//   await db.collection("products").doc(doc.id).delete();
// }
// class DatabaseService {
//   final String uid;
//   DatabaseService({required this.uid});
//   Future userData(String firstName, String lastName, String product) async {
//     return await db.doc(uid).set({
//       'firstName': firstName,
//       'lastName': lastName,
//       'product': product,
//     });
//   }
// }

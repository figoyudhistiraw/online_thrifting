import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thriftnstash/models/product.dart' as productmodels;
import 'package:thriftnstash/widget/card_ads.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ads"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('uid',
                isEqualTo: FirebaseAuth.instance.currentUser!
                    .uid) // user adalah objek User yang telah login
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final productsCount = snapshot.data!.docs.length;
            final productsList = snapshot.data!.docs
                .map((doc) => productmodels.ProductModels.fromSnap(doc))
                .toList();

            return productsCount == 0
                ? Center(child: Text("There's nothing to see here"))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            "Total ads posted: $productsCount",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Text('Total Ads Posted: $productsCount'),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3,
                                  mainAxisSpacing: 5),
                          shrinkWrap: true,
                          itemCount: productsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = productsList[index];
                            return AdsCard(product: product);
                            // Tambahkan widget lainnya sesuai kebutuhan
                          },
                        ),
                      ],
                    ),
                  );
          }

          return Text("There's no Ads Active");
        },
      ),
    );
  }
}
//     ListView(
//       children: [
//         Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.all(15.0),
//               height: 120,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: const Color(0xff03ac0e),
//                   width: 3,
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 70,
//                     child: const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Text(
//                           "Jumlah iklan : 2",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 44,
//                     color: const Color.fromARGB(255, 3, 172, 14),
//                     child: const Align(
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Text(
//                           "User 1",
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

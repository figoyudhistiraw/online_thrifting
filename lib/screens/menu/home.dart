import 'package:flutter/material.dart';
import 'package:thriftnstash/services/database_service.dart';
import 'package:thriftnstash/models/product.dart' as productmodels;
import '../../widget/card_product.dart';
import '../search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Thrift & Stash"),
          centerTitle: true,
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(Icons.search))
          ],
        ),
        body: FutureBuilder<List<productmodels.ProductModels>>(
            future: DatabaseService().getProductDetails(),
            builder: (context, snapshot) {
            
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("There's nothing to see here"));
              } else {
                List<productmodels.ProductModels> products = snapshot.data!;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10,
                    // Perbandingan lebar-tinggi setiap item produk
                  ),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    productmodels.ProductModels product = products[index];

                    return ProductCard(product: product);
                  },
                );
              }
            }));
  }
}


      // StreamBuilder<QuerySnapshot>(
      //     stream: db.collection('products').snapshots(),
      //     builder: (context, snapshot) {
      //       return !snapshot.hasData
      //           ? Center(
      //               child: CircularProgressIndicator(),
      //             )
      //           : Center(
      //               child: GridView.builder(
      //                 shrinkWrap: true,
      //                 padding: EdgeInsets.all(10),
      //                 itemCount: snapshot.data!.size,
      //                 itemBuilder: (context, i) {
      //                   DocumentSnapshot data = snapshot.data!.docs[i];
      //                   return ProductCard(
      //                     documentSnapshot: data,
      //                     id: data.id,
      //                     title: data['title'],
      //                     location: data['location'],
      //                     price: data['price'],
      //                   );
      //                 },
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   childAspectRatio: 0.6,
      //                   crossAxisSpacing: 0.0,
      //                   mainAxisSpacing: 10,
      //                 ),
      //               ),
      //             );
      //     }),
//     );
//   }
// }

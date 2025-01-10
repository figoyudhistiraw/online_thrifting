import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thriftnstash/models/product.dart';
import 'package:thriftnstash/services/database_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  final ProductModels product;

  const ProductDetails({super.key, required this.product});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Uri message = Uri.parse(
      "I'm interested with your product [tell them what do you want]");
  late var whatsappURL =
      "https://wa.me/62${widget.product.userPhoneNumber}?text=${message}";
  void openWhatsapp() async {
    Uri url = Uri.parse(whatsappURL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication);
    } else {
      throw Exception('Could not launch WhatsApp');
    }
  }

  Widget build(BuildContext context) {
    print(FirebaseFirestore.instance.collection('products').doc().get());
    // print("USER ID DI DETAIL PRODUK: ${widget.product.uid}");
    // print("USER ID SAAT INI: ${FirebaseAuth.instance.currentUser}");
    return Scaffold(
      // APPBAR
      appBar: AppBar(centerTitle: true, title: Text("Details"), actions: [
        if (widget.product.uid == FirebaseAuth.instance.currentUser!.uid)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      DatabaseService().deleteProduct(widget.product);
                    },
                    icon: Icon(
                      Icons.delete,
                    )),
              ],
            ),
          ),
      ]),

      // BOTTOMAPPBAR
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
                child: TextButton(
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      openWhatsapp();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FaIcon(FontAwesomeIcons.whatsapp),
                        Text("  Contact Seller"),
                      ],
                    )),
              ),
              Text(
                widget.product.price,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),

      // BODY
      body: ListView(
        children: [
          Container(
            // clipBehavior: Clip.hardEdge,
            height: 250,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              widget.product.photoUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(widget.product.location),
                SizedBox(
                  height: 15,
                ),
                Text(widget.product.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
// StreamBuilder<QuerySnapshot>(
//     stream: db.collection('products').snapshots(),
//     builder: (context, snapshot) {
//       return !snapshot.hasData
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot data = snapshot.data!.docs[index];
//                 return ItemDetails(
//                   documentSnapshot: data,
//                   id: data.id,
//                   title: data['title'],
//                   price: data['price'],
//                   location: data['location'],
//                   description: data['description'],
//                 );
//               },
//             );

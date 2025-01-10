import 'package:flutter/material.dart';
import 'package:thriftnstash/models/product.dart';
import 'package:thriftnstash/screens/detail_product.dart';

class ProductCard extends StatelessWidget {
  final ProductModels product;
  // final String title;
  // final String location;
  // final String price;
  // final DocumentSnapshot documentSnapshot;
  const ProductCard({super.key, required this.product});
  // ProductCard({
  //   required this.title,
  //   required this.location,
  //   required this.price,
  //   required this.documentSnapshot,
  //   required String id,
  // });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(product: product)));
        },
        child: SizedBox(
          // width: 180,
          // height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(product.photoUrl),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.price,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Divider(height: 10),
                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Divider(height: 10),
                        SizedBox(
                          child: Row(
                            children: [
                              Icon(Icons.location_pin),
                              Text(
                                product.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )

                        // Text(
                        //   "widget.prodsfdsfsffdsfdsfdsf",
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

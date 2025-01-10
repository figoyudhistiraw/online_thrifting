import 'package:flutter/material.dart';
import 'package:thriftnstash/models/product.dart';
import 'package:thriftnstash/screens/detail_product.dart';

class AdsCard extends StatelessWidget {
  final ProductModels product;

  const AdsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
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
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1.3,
                child: Container(
                  child: Image.network(
                    product.photoUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Divider(),
                      Text(
                        product.price,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )

          // Row(
          //   children: [
          //     SizedBox(
          //         width: 150,
          //         child: Image.asset(
          //           "images/image1.jpg",
          //           fit: BoxFit.cover,
          //         )),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Text(product.title), Text("Views: 2")],
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   // width: 180,
          //   // height: 270,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Center(
          //         child: Container(
          //           height: 170,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage("images/product.jpg"),
          //                 fit: BoxFit.cover),
          //           ),
          //         ),
          //       ),
          //       Flexible(
          //         child: SizedBox(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   product.price,
          //                   style: TextStyle(
          //                       fontSize: 16, fontWeight: FontWeight.bold),
          //                   overflow: TextOverflow.ellipsis,
          //                   maxLines: 1,
          //                 ),
          //                 Divider(height: 10),
          //                 Text(
          //                   product.title,
          //                   maxLines: 2,
          //                   overflow: TextOverflow.ellipsis,
          //                 ),
          //                 Divider(height: 10),
          //                 Text(
          //                   product.location,
          //                   maxLines: 1,
          //                   overflow: TextOverflow.ellipsis,
          //                 )

          //                 // Text(
          //                 //   "widget.prodsfdsfsffdsfdsfdsf",
          //                 //   maxLines: 1,
          //                 //   overflow: TextOverflow.ellipsis,
          //                 // )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}

import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thriftnstash/services/database_service.dart';
import 'package:thriftnstash/services/utils.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late String title;
  late String description;
  late String location;
  late String price;
  late File? image;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Center(
                child: Text(
                  "Post Ad",
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff03ac0e),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: titleController,
                onChanged: (value) {
                  title = value;
                },
                maxLength: 50,
                decoration: InputDecoration(
                    label: Text("Ad Title"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              TextFormField(
                controller: descriptionController,
                onChanged: (value) {
                  description = value;
                },
                minLines: 1,
                maxLines: 5,
                maxLength: 1000,
                decoration: InputDecoration(
                    label: Text("Description"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              TextFormField(
                controller: locationController,
                onChanged: (value) {
                  location = value;
                },
                minLines: 1,
                maxLines: 3,
                maxLength: 300,
                decoration: InputDecoration(
                    label: Text("Location"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              Text("Upload Photos"),
              SizedBox(
                height: 10,
              ),
              FilledButton(
                  style: FilledButton.styleFrom(
                      minimumSize: Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () async {
                    File? temp = await pickImage(ImageSource.gallery);
                    setState(() {
                      image = temp;
                    });
                  },
                  child: Icon(Icons.upload)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    name: 'Rp',
                    locale: 'id',
                    decimalDigits: 0,
                  )
                ],
                controller: priceController,
                onChanged: (value) {
                  price = value;
                },
                decoration: InputDecoration(
                    label: Text("Price"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () async {
                  final message = await DatabaseService().addProduct(
                    title,
                    description,
                    location,
                    price,
                    image!,
                  );

                  if (message == 'Post Added') {
                    ScaffoldMessenger(
                      child: SnackBar(content: Text("Product Added")),
                    );
                  } else {
                    ScaffoldMessenger(
                      child:
                          SnackBar(content: Text("There's still empty field")),
                    );
                  }
                },
                child: Text("Post Ad"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

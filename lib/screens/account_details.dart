import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:thriftnstash/models/users.dart' as usermodels;
import 'package:thriftnstash/services/database_service.dart';

class AccDetails extends StatefulWidget {
  const AccDetails({super.key});

  @override
  State<AccDetails> createState() => _AccDetailsState();
}

class _AccDetailsState extends State<AccDetails> {
  TextEditingController userFullNameController =
      TextEditingController(text: "");
  TextEditingController userPhoneNumberController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile Details"),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                usermodels.UserModel userData =
                    usermodels.UserModel.fromSnap(snapshot.data!);
                return ListView(children: [
                  Padding(
                      padding: EdgeInsets.all(25),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 75,
                                  backgroundColor: Colors.grey.shade200,
                                  child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage: NetworkImage(
                                        userData.userPhotoURL,
                                      )),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: InkWell(
                                          onTap: () {
                                            print("buttonpressed");
                                          },
                                          child: Icon(Icons.edit,
                                              color: Colors.black)),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            50,
                                          ),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(2, 4),
                                            color: Colors.black.withOpacity(
                                              0.3,
                                            ),
                                            blurRadius: 3,
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: userData.userFullName,
                                      prefixIcon: Icon(Icons.person_2),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  controller: userFullNameController,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                IntlPhoneField(
                                  decoration: InputDecoration(
                                      hintText: userData.userPhoneNumber,
                                      // prefixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                  controller: userPhoneNumberController,
                                  initialCountryCode: "ID",
                                  disableLengthCheck: true,
                                  onTap: () {},
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 60,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      onPressed: () async {
                                        print(userPhoneNumberController);
                                        await DatabaseService().updateUserData(
                                            userFullNameController.text,
                                            userPhoneNumberController.text);
                                      },
                                      child: Text("Save Edit")),
                                )

                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text("Email"),
                                //     Text(userData.email),
                                //   ],
                                // ),
                              ],
                            )
                          ],
                        ),
                      )),
                ]);
              }
              return Text("Fatal Error");
            }));
  }
}

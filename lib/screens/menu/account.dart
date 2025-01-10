import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftnstash/providers/user_provider.dart';
import 'package:thriftnstash/screens/account_details.dart';
import 'package:thriftnstash/services/authentication_service.dart';
import 'package:thriftnstash/models/users.dart' as usermodel;

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _AccountPageState extends State<AccountPage> {
  bool isLoading = true;

  void loadData() async {
    // Set isLoading to false to indicate data loading is complete
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    usermodel.UserModel? userData =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              userData!.userPhotoURL.isEmpty
                  ? CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("images/profile-user.png"),
                    )
                  : Stack(
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
                      ],
                    ),
              
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      userData.userFullName,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(userData.email),
                    SizedBox(
                      height: 10,
                    ),
                    FilledButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => AccDetails())));
                        },
                        child: Text("Update Profile"))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        dense: true,
                        horizontalTitleGap: 2,
                        title: Text("Settings"),
                        subtitle: Text("App preferences"),
                        leading: Icon(Icons.settings_sharp),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        dense: true,
                        horizontalTitleGap: 2,
                        title: Text("Help & Support"),
                        subtitle: Text("About Us and FAQ"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Icon(Icons.info_outline),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: null,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          dense: true,
                          horizontalTitleGap: 2,
                          title: Text("Sign Out"),
                          trailing: Icon(Icons.arrow_forward_ios),
                          leading: Icon(Icons.logout_outlined),
                          onTap: () async {
                            await AuthService.signOut();
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Stack(children: [
              //     SizedBox(
              //       child: SizedBox(
              //         child: CircleAvatar(
              //           radius: 75,
              //           backgroundImage: NetworkImage(
              //             userData.userPhotoURL,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //         bottom: 0,
              //         left: 100,
              //         child: FilledButton(
              //             style: FilledButton.styleFrom(
              //                 elevation: 4,
              //                 backgroundColor: Colors.white,
              //                 visualDensity: VisualDensity.compact),
              //             onPressed: () async {
              //               // File? temp = await pickImage(ImageSource.gallery);
              //               // setState(() {
              //               //   image = temp;
              //               // });
              //             },
              //             child: Icon(
              //               Icons.edit,
              //               color: Colors.black,
              //             )))
              //   ]),

              // if (Provider.of<UserProvider>(context).getUser!.photoURL ==
              //     null)
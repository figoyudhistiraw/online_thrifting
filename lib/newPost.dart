import 'package:flutter/material.dart';

class NewPostWidget extends StatelessWidget {
  const NewPostWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              height: 35,
            ),
            Text(
              "Jual Barang",
              style: TextStyle(
                  fontSize: 18,
                  color: const Color(0xff03ac0e),
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 30,
            ),
            Text("Kategori"),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff03ac0e), width: 2),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )
                ],
              ),
            ),
            Text("Deskripsi"),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff03ac0e), width: 2),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )
                ],
              ),
            ),
            Text("Lokasi"),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff03ac0e), width: 2),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )
                ],
              ),
            ),
            Text("Foto"),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff03ac0e), width: 2),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff03ac0e),
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Upload      Gambar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )
                ],
              ),
            ),
            Text("Harga"),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff03ac0e), width: 2),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff03ac0e),
                        borderRadius: BorderRadius.circular(10)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Rp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: BoxDecoration(
                  color: const Color(0xff03ac0e),
                  borderRadius: BorderRadius.circular(14)),
              child: Stack(
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Posting Iklan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text("Logout")
          ],
        ),
      ],
    );
  }
}

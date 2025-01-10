import 'dart:io';

import 'package:image_picker/image_picker.dart';

File? image;
Future pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  //final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
  final pickedFile = await imagePicker.pickImage(source: source);
  print(pickedFile);
  if (pickedFile != null) {
    image = File(pickedFile.path);
    print("Image Selected ${File}");
  } else {
    print("No image selected");
  }
  return image;
  // if (pickedFile != null) {
  //   _photo = File(pickedFile.path);
  //   print("Image Selected ${File}");
  // } else {
  //   print("No image selected");
  // }
}

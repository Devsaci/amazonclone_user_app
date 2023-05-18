import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_text_field.dart';

class RegistrationTabPage extends StatefulWidget {
  const RegistrationTabPage({Key? key}) : super(key: key);

  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
  TextEditingController();

  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  void getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  formValidation() async {
    if (imgXFile == null) {
      Fluttertoast.showToast(msg: "Please select an image.");
    }
    else //image is already selected
        {
      //password is equal to confirm password
      if (passwordTextEditingController.text ==
          confirmPasswordTextEditingController.text) {}else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          //get-capture image
          GestureDetector(
            onTap: () {
              getImageFromGallery();
            },
            child: CircleAvatar(
              radius: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              backgroundColor: Colors.white,
              backgroundImage: imgXFile == null
                  ? null
                  : FileImage(
                File(imgXFile!.path),
              ),
              child: imgXFile == null
                  ? Icon(
                Icons.add_photo_alternate,
                color: Colors.black,
                size: MediaQuery
                    .of(context)
                    .size
                    .width * 0.2,
              )
                  : null,
            ),
          ),
          //inputs form fields
          Form(
            key: formKey,
            child: Column(
              children: [
                //name
                CustomTextField(
                  textEditingController: nameTextEditingController,
                  isObsecre: false,
                  iconData: Icons.person,
                  hintText: "Name",
                  enabled: true,
                ),
                //email
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  iconData: Icons.email,
                  hintText: "Email",
                  isObsecre: false,
                  enabled: true,
                ),
                //pass
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  iconData: Icons.lock,
                  hintText: "Password",
                  isObsecre: true,
                  enabled: true,
                ),
                //confirm pass
                CustomTextField(
                  textEditingController: confirmPasswordTextEditingController,
                  iconData: Icons.lock,
                  hintText: "Confirm Password",
                  isObsecre: true,
                  enabled: true,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
          //ElevatedButton
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () {
                if (kDebugMode) {
                  print("Registration done");
                }
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

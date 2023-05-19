import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
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

  String downloadUrlImage = "";

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
    } else //image is already selected
    {
      //password is equal to confirm password
      if (passwordTextEditingController.text ==
          confirmPasswordTextEditingController.text) {
        //check email, pass, confirm password & name text fields
        if (nameTextEditingController.text.isNotEmpty &&
            emailTextEditingController.text.isNotEmpty &&
            passwordTextEditingController.text.isNotEmpty &&
            confirmPasswordTextEditingController.text.isNotEmpty) {
          //1.upload image to storage
          // 1.1. creat unique name by time (fileName)
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          // 1.2. creat folder usersImages
          fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
              .ref()
              .child("usersImages")
              .child(fileName);
          // 1.3. upload imgXFile to usersImages
          fStorage.UploadTask uploadImageTask =
              storageRef.putFile(File(imgXFile!.path));

          fStorage.TaskSnapshot taskSnapshot =
              await uploadImageTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((urlImage) {
            downloadUrlImage = urlImage;
          });

          //2. save the user info to firestore database
        } else {
          Fluttertoast.showToast(
              msg:
                  "Please complete the form. Do not leave any text field empty.");
        }
      } else //password is NOT equal to confirm password
      {
        Fluttertoast.showToast(
            msg: "Password and Confirm Password do not match.");
      }
    }
  }

  saveInformationToDatabase() async {
    //authenticate the user first
    User? currentUser;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      return null;
    }).catchError((errorMessage) {
      Fluttertoast.showToast(msg: "Error Occurred: \n $errorMessage");
    });
    if (currentUser != null) {
      //save info to database and save locally
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
              radius: MediaQuery.of(context).size.width * 0.2,
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
                      size: MediaQuery.of(context).size.width * 0.2,
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
                //FormFieldValidator;
                formValidation();
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

import 'package:amazonclone_user_app/widgets/custom_text_field.dart';
import 'package:amazonclone_user_app/widgets/loading_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({super.key});

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      //allow user to login
      loginNow();
    } else {
      Fluttertoast.showToast(msg: "Please provide email and password.");
    }
  }

  void loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialogWidget(
            message: "Checking credentials",
          );
        });

    User? currentUser;

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred: \n $errorMessage");
    });

    if (currentUser != null) {
      checkIfUserRecordExists(currentUser!);
    }
  }

  void checkIfUserRecordExists(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((record) async{
      if(record.exists) //record exists
      {
        //status is approved
        if(record.data()!["status"] == "approved")
        {
          await sharedPreferences!.setString("uid", record.data()!["uid"]);
          await sharedPreferences!.setString("email", record.data()!["email"]);
          await sharedPreferences!.setString("name", record.data()!["name"]);
        }
        else
        {

        }
      }
      else //record not exists
      {
        Fluttertoast.showToast(msg: "This user's record do not exists.");
      }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/login.png",
                height: MediaQuery.of(context).size.height * 0.26,
                opacity: const AlwaysStoppedAnimation(0.9)),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                //email
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  isObsecre: false,
                  iconData: Icons.email,
                  hintText: "Email",
                  enabled: true,
                ),

                //pass
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  isObsecre: true,
                  iconData: Icons.lock,
                  hintText: "Password",
                  enabled: true,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12)),
            onPressed: () {
              validateForm();
            },
            child: const Text("Login "),
          ),
        ],
      ),
    );
  }
}

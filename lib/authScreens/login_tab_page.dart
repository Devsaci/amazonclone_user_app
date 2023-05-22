import 'package:amazonclone_user_app/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    } else {
      Fluttertoast.showToast(msg: "msg");
    }
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

import 'package:amazonclone_user_app/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';

class LoginTabPage extends StatefulWidget {
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  GlobalKey<FormState>  formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
            const SizedBox(height: 10),
            //pass
            CustomTextField(
              textEditingController: passwordTextEditingController,
              isObsecre: true,
              iconData: Icons.lock,
              hintText: "Password",
              enabled: true,
            ),
          ],
        ),
      ),
    );
  }
}

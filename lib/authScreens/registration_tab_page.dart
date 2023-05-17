import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegistrationTabPage extends StatefulWidget {
  const RegistrationTabPage({Key? key}) : super(key: key);

  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          //get-capture image
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print("take a photograph");
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: MediaQuery.of(context).size.width * 0.2,
              child: Icon(
                Icons.add_photo_alternate,
                color: Colors.black,
                size: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
          ),
          //inputs form fields
          Form(
            key: formKey,
            child: const Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

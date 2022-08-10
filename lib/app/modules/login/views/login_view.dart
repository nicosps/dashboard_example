import 'package:dashboard_example/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.add_a_photo,
                  size: 116,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 58.32),
              textField(nameController, "Name"),
              const SizedBox(height: 22.12),
              textField(palindromeController, "Palindrome"),
              const SizedBox(height: 45),
              button(() {
                if (controller.isPanlindrome(palindromeController.text) ==
                    true) {
                  showAlertDialog(context, "isPalindrome");
                } else {
                  showAlertDialog(context, "not palindrome");
                }
              }, 'CHECK'),
              const SizedBox(height: 15),
              button(() {
                if (nameController.text.isEmpty) {
                  showAlertDialog(context, "Please Input Name");
                } else {
                  Get.to(HomeView(name: nameController.text));
                }
              }, 'NEXT'),
            ],
          ),
        ],
      ),
    );
  }

  Widget textField(
    TextEditingController textEditingController,
    String hintText,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Color(0xff686777).withOpacity(0.36),
            fontSize: 16,
          ),
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.94),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget button(dynamic onPress, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(310, 41),
        elevation: 0,
        primary: Color(0xFF2B637B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      onPressed: () {
        onPress();
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14),
      ),
    );
  }

  showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}

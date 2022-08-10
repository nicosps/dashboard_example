import 'package:dashboard_example/app/modules/users/views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/user_model.dart';
import '../../webview/views/webview_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final String name;
  final Data? userModel;
  const HomeView({Key? key, this.name = "", this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            color: Color(0xFF2B637B),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: Color(0xFF2B637B),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 13),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF04021D),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: Color(0xFF04021D),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              userModel?.avatar == null
                  ? Column(
                      children: [
                        Center(
                          child: Icon(
                            Icons.verified_user,
                            size: 164,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Center(
                          child: Text(
                            'Select a user to show the profile',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF808080),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9999),
                            child: Image.network(
                              userModel?.avatar ?? "",
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Center(
                          child: Text(
                            userModel?.firstName == ""
                                ? 'Select a user to show the profile'
                                : '${userModel!.firstName} ${userModel!.lastName}',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF808080),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            userModel?.email == ""
                                ? 'Select a user to show the profile'
                                : '${userModel!.email}',
                            style: GoogleFonts.poppins(
                              color: Color(0xFF808080),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(WebviewView());
                            },
                            child: Text(
                              'Website',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF2B637B),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(310, 41),
                    elevation: 0,
                    primary: Color(0xFF2B637B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () {
                    Get.to(UsersView());
                  },
                  child: Text(
                    'Choose a User',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

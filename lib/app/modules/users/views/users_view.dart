import 'package:dashboard_example/app/data/repositories/user_repository.dart';
import 'package:dashboard_example/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/users_controller.dart';

class UsersView extends StatefulWidget {
  UsersView({Key? key}) : super(key: key);

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final UsersController controller = Get.put(
    UsersController(userRepository: UserRepository()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Users',
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
      body: Obx(
        () => (controller.isFetching.value ||
                controller.userModel.value.data.isEmpty)
            ? Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              )
            : NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  itemCount: controller.userModel.value.data.length,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shrinkWrap: true,
                  primary: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          HomeView(
                            userModel: controller.userModel.value.data[index],
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9999),
                                child: Image.network(
                                  controller.userModel.value.data[index].avatar,
                                  width: 49,
                                  height: 49,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.userModel.value.data[index].firstName} ${controller.userModel.value.data[index].lastName}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    controller
                                        .userModel.value.data[index].email,
                                    style: GoogleFonts.poppins(
                                      color: Color(0XFF686777),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 19),
                            child: Divider(height: 1),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

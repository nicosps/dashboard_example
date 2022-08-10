import 'package:dashboard_example/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../controllers/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
      () => UsersController(userRepository: UserRepository()),
    );
  }
}

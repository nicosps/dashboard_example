import 'package:dashboard_example/app/data/models/user_model.dart';
import 'package:dashboard_example/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final UserRepository userRepository;

  UsersController({required this.userRepository});

  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
  }

  final isFetching = false.obs;
  final userModel = UserModel(support: Support()).obs;

  loadUserData() async {
    if (isFetching.value) return;
    isFetching.value = true;
    try {
      var response = await userRepository.getUserData();
      userModel.value = response;
    } catch (e) {
      print(e);
    } finally {
      isFetching.value = false;
    }
  }
}

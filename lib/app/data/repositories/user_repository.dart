import 'package:dashboard_example/app/data/models/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  var dio = Dio();

  Future<UserModel> getUserData() async {
    try {
      var response = await dio.get(
        "https://reqres.in/api/users?page=1&per_page=10",
      );
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      throw {
        'status': e.response!.statusCode,
        'errors': e.response!.data['errors'],
      };
    }
  }
}

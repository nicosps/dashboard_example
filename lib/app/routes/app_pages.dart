import 'package:get/get.dart';

import 'package:dashboard_example/app/modules/home/bindings/home_binding.dart';
import 'package:dashboard_example/app/modules/home/views/home_view.dart';
import 'package:dashboard_example/app/modules/login/bindings/login_binding.dart';
import 'package:dashboard_example/app/modules/login/views/login_view.dart';
import 'package:dashboard_example/app/modules/users/bindings/users_binding.dart';
import 'package:dashboard_example/app/modules/users/views/users_view.dart';
import 'package:dashboard_example/app/modules/webview/bindings/webview_binding.dart';
import 'package:dashboard_example/app/modules/webview/views/webview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => UsersView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => WebviewView(),
      binding: WebviewBinding(),
    ),
  ];
}

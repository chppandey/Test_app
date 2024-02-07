import 'package:demo_app/model/login_model.dart';


abstract class AppRepository {
  getData() {}
  postData(LoginModel baseModel) {}
}
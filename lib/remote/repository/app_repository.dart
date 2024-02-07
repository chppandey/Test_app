import 'package:demo_app/remote/model/login_model.dart';


abstract class AppRepository {
  getData() {}
  postData(LoginModel baseModel) {}
}
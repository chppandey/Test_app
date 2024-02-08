import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  setUserID({required String userID}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('userId', userID);
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  setUserToken({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userToken", userToken);
  }

  getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userToken");
  }

  setOnBoaringScreen({required bool isSeen}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isSeen", isSeen);
  }

  getOnBoardBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isSeen");
  }

  Future<void> deleteAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("userToken");
    await prefs.remove("isSeen");
  }
}

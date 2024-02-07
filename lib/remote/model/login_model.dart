class LoginModel {
  String? identity;
  String? password;

  LoginModel({this.identity, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    identity = json['identity'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['password'] = password;
    return data;
  }
}

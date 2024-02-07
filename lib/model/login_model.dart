class LoginResponseModel {
  int? status;
  String? token;
  String? userid;
  String? roleId;
  String? loginAt;
  String? tIDFormat;
  String? latLonFormat;
  String? distanceUnit;
  String? windspeedUnit;
  String? dateFormat;
  String? loginID;
  String? phoneNo;
  String? emergencyContactNo;
  String? emergencyContactPerson;
  String? firstName;
  String? lastName;
  String? regionId;
  String? centerId;
  String? userProfileImage;
  String? role;
  String? sessionExpiryDateTime;
  String? isSuperUser;
  String? lastLoginDate;
  String? createdOn;
  String? createdBy;
  String? trackingEnabled;
  String? message;
  String? error;

  LoginResponseModel(
      {this.status,
      this.token,
      this.userid,
      this.roleId,
      this.loginAt,
      this.tIDFormat,
      this.latLonFormat,
      this.distanceUnit,
      this.windspeedUnit,
      this.dateFormat,
      this.loginID,
      this.phoneNo,
      this.emergencyContactNo,
      this.emergencyContactPerson,
      this.firstName,
      this.lastName,
      this.regionId,
      this.centerId,
      this.userProfileImage,
      this.role,
      this.sessionExpiryDateTime,
      this.isSuperUser,
      this.lastLoginDate,
      this.createdOn,
      this.createdBy,
      this.trackingEnabled,
      this.message,
      this.error});

  LoginResponseModel.withError(String err) {
    error = err;
  }

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    userid = json['userid'];
    roleId = json['roleId'];
    loginAt = json['loginAt'];
    tIDFormat = json['tIDFormat'];
    latLonFormat = json['latLonFormat'];
    distanceUnit = json['distanceUnit'];
    windspeedUnit = json['windspeedUnit'];
    dateFormat = json['dateFormat'];
    loginID = json['LoginID'];
    phoneNo = json['PhoneNo'];
    emergencyContactNo = json['EmergencyContactNo'];
    emergencyContactPerson = json['EmergencyContactPerson'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    regionId = json['RegionId'];
    centerId = json['CenterId'];
    userProfileImage = json['UserProfileImage'];
    role = json['role'];
    sessionExpiryDateTime = json['SessionExpiryDateTime'];
    isSuperUser = json['IsSuperUser'];
    lastLoginDate = json['LastLoginDate'];
    createdOn = json['CreatedOn'];
    createdBy = json['CreatedBy'];
    trackingEnabled = json['TrackingEnabled'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    data['userid'] = userid;
    data['roleId'] = roleId;
    data['loginAt'] = loginAt;
    data['tIDFormat'] = tIDFormat;
    data['latLonFormat'] = latLonFormat;
    data['distanceUnit'] = distanceUnit;
    data['windspeedUnit'] = windspeedUnit;
    data['dateFormat'] = dateFormat;
    data['LoginID'] = loginID;
    data['PhoneNo'] = phoneNo;
    data['EmergencyContactNo'] = emergencyContactNo;
    data['EmergencyContactPerson'] = emergencyContactPerson;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['RegionId'] = regionId;
    data['CenterId'] = centerId;
    data['UserProfileImage'] = userProfileImage;
    data['role'] = role;
    data['SessionExpiryDateTime'] = sessionExpiryDateTime;
    data['IsSuperUser'] = isSuperUser;
    data['LastLoginDate'] = lastLoginDate;
    data['CreatedOn'] = createdOn;
    data['CreatedBy'] = createdBy;
    data['TrackingEnabled'] = trackingEnabled;
    data['message'] = message;
    return data;
  }
}

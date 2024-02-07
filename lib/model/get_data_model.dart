class GetDataModel {
  int? vesselCnt;
  int? boatownrCnt;
  int? alertCnt;
  int? userCnt;
  int? crewCnt;
  int? geoboundaryAlertCnt;
  int? infoAlertCnt;
  String? status;
  String? message;

  String? errorMsg;

  GetDataModel(
      {this.vesselCnt,
      this.boatownrCnt,
      this.alertCnt,
      this.userCnt,
      this.crewCnt,
      this.geoboundaryAlertCnt,
      this.infoAlertCnt,
      this.status,
      this.message,
      this.errorMsg});

  GetDataModel.withError(String error) {
    errorMsg = error;
  }

  GetDataModel.fromJson(Map<String, dynamic> json) {
    vesselCnt = json['vesselCnt'];
    boatownrCnt = json['boatownrCnt'];
    alertCnt = json['alertCnt'];
    userCnt = json['userCnt'];
    crewCnt = json['crewCnt'];
    geoboundaryAlertCnt = json['geoboundaryAlertCnt'];
    infoAlertCnt = json['infoAlertCnt'];
    status = json['status'];
    message = json['message'];
  }
}

class ExpansesModel {
  String? stName;
  String? expansesType;
  String? expanseStatus;
  String? expansesamount;
  String? pPhone;
  String? pEmail;
  String? dueDate;
  String? gender;

  ExpansesModel({
    this.stName,
    this.expansesType,
    this.expanseStatus,
    this.expansesamount,
    this.pPhone,
    this.pEmail,
    this.dueDate,
    this.gender,
  });

  ExpansesModel.fromJson(Map<String, dynamic> json) {
    stName = json['stName'];
    expansesType = json['expansesType'];
    expanseStatus = json['expanseStatus'];
    expansesamount = json['expansesamount'];
    pPhone = json['pPhone'];
    pEmail = json['pEmail'];
    dueDate = json['dueDate'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stName'] = stName;
    data['expansesType'] = expansesType;
    data['expanseStatus'] = expanseStatus;
    data['expansesamount'] = expansesamount;
    data['pPhone'] = pPhone;
    data['pEmail'] = pEmail;
    data['dueDate'] = dueDate;
    data['gender'] = gender;

    return data;
  }
}

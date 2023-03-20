class TeacherModel {
  String? tFname;
  String? tLtName;
  String? tGender;
  String? tDOB;
  String? bGroup;
  String? religion;
  String? email;
  String? phone;
  String? subject;
  String? addrss;
  String? joiningDate;

  TeacherModel(
      {this.tFname,
      this.tLtName,
      this.tGender,
      this.tDOB,
      this.bGroup,
      this.religion,
      this.email,
      this.phone,
      this.subject,
      this.addrss,
      this.joiningDate});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    tFname = json['tFname'];
    tLtName = json['tLtName'];
    tGender = json['tGender'];
    tDOB = json['tDOB'];
    bGroup = json['bGroup'];
    religion = json['religion'];
    email = json['email'];
    phone = json['phone'];
    subject = json['subject'];
    addrss = json['addrss'];
    joiningDate = json['joiningDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tFname'] = tFname;
    data['tLtName'] = tLtName;
    data['tGender'] = tGender;
    data['tDOB'] = tDOB;
    data['bGroup'] = bGroup;
    data['religion'] = religion;
    data['email'] = email;
    data['phone'] = phone;
    data['subject'] = subject;
    data['addrss'] = addrss;
    data['joiningDate'] = joiningDate;
    return data;
  }
}

class TeacherModel {
  String? tFname;
  String? tLtName;
  String? tGender;
  String? tDOB;
  String? tbGroup;
  String? treligion;
  String? temail;
  String? tphone;
  String? tsubject;
  String? taddrss;
  String? tjoiningDate;
  int? teacherID;

  TeacherModel(
      {this.tFname,
      this.tLtName,
      this.tGender,
      this.tDOB,
      this.tbGroup,
      this.treligion,
      this.temail,
      this.tphone,
      this.tsubject,
      this.taddrss,
      this.tjoiningDate,
      this.teacherID});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    tFname = json['tFname'];
    tLtName = json['tLtName'];
    tGender = json['tGender'];
    tDOB = json['tDOB'];
    tbGroup = json['bGroup'];
    treligion = json['religion'];
    temail = json['email'];
    tphone = json['tphone'];
    tsubject = json['tsubject'];
    taddrss = json['taddrss'];
    tjoiningDate = json['joiningDate'];
    teacherID = json['teacherID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tfname'] = tFname;
    data['tltName'] = tLtName;
    data['tgender'] = tGender;
    data['tDOB'] = tDOB;
    data['bgroup'] = tbGroup;
    data['treligion'] = treligion;
    data['temail'] = temail;
    data['tphone'] = tphone;
    data['tsubject'] = tsubject;
    data['taddrss'] = taddrss;
    data['tjoiningDate'] = tjoiningDate;
    data['teacherID'] = teacherID;
    return data;
  }
}

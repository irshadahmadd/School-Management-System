class SubjectModel {
  String? subjectName;
  String? teacherName;
  String? classes;
  String? dayes;
  int? subjectID;

  SubjectModel(
      {this.subjectName,
      this.teacherName,
      this.classes,
      this.dayes,
      this.subjectID});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    teacherName = json['teacherName'];
    classes = json['classes'];
    dayes = json['dayes'];
    subjectID = json['subjectID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectName'] = subjectName;
    data['teacherName'] = teacherName;
    data['classes'] = classes;
    data['dayes'] = dayes;
    data['subjectID'] = subjectID;
    return data;
  }
}

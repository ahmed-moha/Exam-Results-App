class ExamModel {
  String? id;
  String? student;
  String? name;
  String? examStatus;
  String? mark;
  String? created;

  ExamModel(
      {this.id,
      this.student,
      this.name,
      this.examStatus,
      this.mark,
      this.created});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    name = json['name'];
    examStatus = json['exam status'];
    mark = json['mark'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student'] = student;
    data['name'] = name;
    data['exam status'] = examStatus;
    data['mark'] = mark;
    data['created'] = created;
    return data;
  }
}

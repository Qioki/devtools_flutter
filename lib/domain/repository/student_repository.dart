import 'package:devtools_flutter/domain/entity/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
  Future<List<Student>> getActivists();
  void changeStudentStatus(Student student) {}
}

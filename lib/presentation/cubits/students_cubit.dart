import 'package:devtools_flutter/domain/entity/student.dart';
import 'package:devtools_flutter/domain/repository/student_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsCubit extends Cubit<StudentsState> {
  final StudentRepository _studentRepository;
  StudentsCubit(this._studentRepository) : super(StudentsState([])) {
    fetchStudents();
  }

  void fetchStudents() async =>
      emit(StudentsState(await _studentRepository.getStudents()));

  void changeStudentStatus(Student student) async {
    _studentRepository.changeStudentStatus(student);
    fetchStudents();
  }
}

class StudentsState {
  final List<Student> students;
  StudentsState(this.students);
}

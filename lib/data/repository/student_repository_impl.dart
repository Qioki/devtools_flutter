import 'package:devtools_flutter/domain/entity/student.dart';
import 'package:devtools_flutter/domain/repository/student_repository.dart';
import 'package:faker/faker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StudentRepository)
class StudentRepositoryImpl implements StudentRepository {
  final List<Student> _students = [];

  @PostConstruct()
  void init() {
    Faker faker = Faker();
    for (int i = 0; i < 20; i++) {
      Student student = Student(
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        email: faker.internet.email(),
        imageLink: 'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
        isActivist: faker.randomGenerator.boolean(),
      );
      _students.add(student);
    }
  }

  @override
  Future<List<Student>> getStudents() => Future.value(_students);

  @override
  Future<List<Student>> getActivists() =>
      Future.value(_students.where((element) => element.isActivist).toList());

  @override
  void changeStudentStatus(Student student) {
    var index = _students.indexOf(student);
    if (index >= 0) {
      _students[index] = student.copyWith(isActivist: !student.isActivist);
    }
  }
}

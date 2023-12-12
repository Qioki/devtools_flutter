import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@Freezed(copyWith: true)
class Student with _$Student {
  const factory Student({
    required String firstName,
    required String lastName,
    required String email,
    required String imageLink,
    required bool isActivist,
  }) = _Student;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);
}

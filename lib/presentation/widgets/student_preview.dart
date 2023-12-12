import 'package:devtools_flutter/domain/entity/student.dart';
import 'package:flutter/material.dart';

class StudentPreview extends StatelessWidget {
  const StudentPreview(
      {required this.student, required this.onStudentStatusChange, super.key});
  final Student student;
  final void Function(Student) onStudentStatusChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            ResizeImage(NetworkImage(student.imageLink), width: 120),
      ),
      title: Text('${student.firstName} ${student.lastName}'),
      subtitle: Text(student.email),
      trailing: IconButton(
          onPressed: () => onStudentStatusChange(student),
          icon: student.isActivist
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
    );
  }
}

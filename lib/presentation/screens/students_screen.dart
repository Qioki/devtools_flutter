import 'package:devtools_flutter/domain/entity/student.dart';
import 'package:devtools_flutter/presentation/cubits/students_cubit.dart';
import 'package:devtools_flutter/presentation/widgets/student_preview.dart';
import 'package:devtools_flutter/presentation/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: BlocBuilder<StudentsCubit, StudentsState>(
        builder: (context, state) => state.students.isEmpty
            ? const Center(child: Text('No students found'))
            : ListView.builder(
                itemCount: state.students.length,
                itemBuilder: (context, index) => StudentPreview(
                  student: state.students[index],
                  onStudentStatusChange: (student) async {
                    var result = await confirmChange(context);
                    if (result == true) {
                      cubit.changeStudentStatus(student);
                    }
                  },
                ),
              ),
      ),
    );
  }

  Widget _buildStudentPreview(Student student) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(student.imageLink),
      ),
      title: Text('${student.firstName} ${student.lastName}'),
      subtitle: Text(student.email),
      trailing: student.isActivist
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border),
    );
  }
}

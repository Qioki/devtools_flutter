import 'package:devtools_flutter/presentation/cubits/students_cubit.dart';
import 'package:devtools_flutter/presentation/widgets/student_preview.dart';
import 'package:devtools_flutter/presentation/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivistsScreen extends StatelessWidget {
  const ActivistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StudentsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activists'),
      ),
      body: BlocBuilder<StudentsCubit, StudentsState>(
        builder: (context, state) {
          var activists =
              state.students.where((element) => element.isActivist).toList();

          return activists.isEmpty
              ? const Center(child: Text('No activists found'))
              : ListView.builder(
                  itemCount: activists.length,
                  itemBuilder: (context, index) => StudentPreview(
                    student: activists[index],
                    onStudentStatusChange: (student) async {
                      var result = await confirmChange(context);
                      if (result == true) {
                        cubit.changeStudentStatus(student);
                      }
                    },
                  ),
                );
        },
      ),
    );
  }
}

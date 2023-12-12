import 'package:devtools_flutter/di/locator.dart';
import 'package:devtools_flutter/domain/repository/student_repository.dart';
import 'package:devtools_flutter/presentation/cubits/students_cubit.dart';
import 'package:devtools_flutter/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => StudentsCubit(locator<StudentRepository>()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}

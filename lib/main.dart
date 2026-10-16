import 'package:flutter/material.dart';
import 'package:student_list/students_screen.dart';
//import 'screens/student_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/student__bloc.dart';


void main() {
  runApp(const StudentRecordsApp());
}


class StudentRecordsApp extends StatelessWidget {
  const StudentRecordsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>StudentBloc(),
      child: MaterialApp(
        title: 'Student Records App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const StudentsScreen(),
      ),
    );
  }
}
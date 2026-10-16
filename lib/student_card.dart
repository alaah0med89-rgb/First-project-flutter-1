import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/bloc/student__bloc.dart';
class StudentCardWidget  extends StatelessWidget {
  final Student student;
  const StudentCardWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: Key(student.Id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<StudentBloc>().add(DeleteStudent(student.Id));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${student.name} deleted'),
          action: SnackBarAction(label: 'Undo', onPressed: () {}),
          ),
        );


      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete,color: Colors.white,),
      ),
      child: Card(
        color: student.color,
        child: ListTile(
          title: Text(student.name),
          subtitle: Text(student.idNumber),
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_list/student_model.dart';

import 'bloc/student__bloc.dart';
import "package:flutter_bloc/student_model.dart";
class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreen();
}
 class_StudentsScreenState extends void State<StudentsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(LoadStudentsEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Students Record '),
      ),
      body:BlocBuilder<StudentBloc, StudentState>(
builder: (context, state) {
  if (state is StudentInitial) {
    return const Center(child: CircularProgressIndicator());
  }else if (state is StudentEmpty) {
    return const EmptyStateWidget();
    }else if (state is StudentLoaded) {

    return ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 80),
        itemCount:state.students.length ,
        itemBuilder: (context, index) {
return StudentCardWidget(student:state.students[index]);
},
return const SizedBox.shrink();


      );
}
),
      floatingActionButton: FloatingActionButton(
      onPressed: () => _showAddStudentSheet(context),
        backgroundColor: const Color(0xFF2563EB),
        shape: const CircleBorder(),
        child: const Icon(Icons.add,color: Colors.white,size: 31,),
      ),
    );
  }
  void _showAddStudentSheet(BuildContext context) {
    final nameController = TextEditingController();
    final idController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
        bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,left: 16,right: 16,top: 25
),
          child: Column(
           mainAxisSize: MainAxisSize.min ,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Student Name',
              ),
            ),
            const SizedBox(height: 25),
           ElevatedButton(onPressed: () {
             if (nameController.text.isNotEmpty && idController.text.isNotEmpty) {
              context.read<StudentBloc>().add(AddStudent(nameController.text,idController.text)
);
               Navigator.pop(bottomSheetContext);
}

           },
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF2563EB),
padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
maximumSize: const Size(double.infinity, 50),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

),
child: const Text('Add Student',style: TextStyle(color: Colors.white,fontSize: 20),),

),
),
],


        );
      },

}
)
  }

class EmptyStateWidget {
  const EmptyStateWidget();
})

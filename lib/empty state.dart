import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.school_outlined,size: 100,color: Colors.grey,
      ),
      const SizedBox(height: 20,),
      Text('لا يوجد طلاب حاليا في هذا الفصل ',
      style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.grey[700]),
      ),
        const SizedBox(height: 8),
      Text('اضغط على زر + لاضافة طلاب جدد',
      style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.grey[700]),
      ),
      ]





    )
    );
  }
}

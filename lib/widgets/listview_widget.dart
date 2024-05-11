import 'package:flutter/material.dart';
import 'package:student_record_getx/model/data_model.dart';
import 'package:student_record_getx/screens/edit_profile.dart';
import 'package:student_record_getx/screens/screen_list_details.dart';
import 'package:student_record_getx/screens/screen_profile.dart';

class ListViewWidget extends StatelessWidget {
  final List<StudentModel> studentList;
  const ListViewWidget({
    
    super.key,required this.studentList
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
       itemBuilder: (context, index) {
         final data = studentList[index];
         return ListTile(
           onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => Profile(
                       studentModel: studentList[index],
                     )));
           },
          
           leading:  CircleAvatar(
             backgroundImage:MemoryImage(data.image!)
            
             
             // backgroundImage: NetworkImage(
             //     'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
             ,radius: 30,
           ),
           title: Text(data.name),
           subtitle: Text(data.age),
           trailing: Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               IconButton(
                 onPressed: () {
                 
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => EditProfile(
                             studentModel: studentList[index],
                           )));
                 },
                 icon: const Icon(
                   Icons.edit,
                   color: Color.fromARGB(255, 126, 202, 128),
                 ),
               ),
               const SizedBox(width: 8),
               IconButton(
                 onPressed: () {
                   deleteAlert(context, studentList[index].id!);
                 },
                 icon: const Icon(
                   Icons.delete,
                   color: Colors.red,
                 ),
               ),
             ],
           ),
         );
       },
       separatorBuilder: (context, index) {
         return const Divider();
       },
       itemCount: studentList.length);
  }
}
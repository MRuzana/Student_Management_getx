import 'dart:typed_data';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_record_getx/controllers/student_controller.dart';
import 'package:student_record_getx/functions/db_functions.dart';
import 'package:student_record_getx/model/data_model.dart';
import 'package:student_record_getx/screens/screen_add_details.dart';
import 'package:student_record_getx/widgets/gridview_widget.dart';
import 'package:student_record_getx/widgets/listview_widget.dart';
import 'package:student_record_getx/widgets/no_student_widget.dart';



class ListDetails extends StatelessWidget {
  late final StudentModel studentModel;
  final ValueNotifier<bool> isGridViewNotifier = ValueNotifier(false);
  final _studentList = List<StudentModel>.empty();
  ListDetails({super.key});

  @override
  Widget build(BuildContext context) {
   // getAllStudents();
   Get.put(StudentController());
   Get.find<StudentController>().getAllStudentController();

    return Scaffold(
      appBar: EasySearchBar(
        actions: [
          IconButton(
              onPressed: () {
                isGridViewNotifier.value = !isGridViewNotifier.value;
                //getAllStudents();
                Get.put(StudentController());
                Get.find<StudentController>().getAllStudentController();

              },
              icon: const Icon(Icons.view_module))
        ],
        title: const Text(
          'Student list',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        onSearch: (value) async {
          
          List<StudentModel> searchedResult = await Get.find<StudentController>().searchController(value);
          studentList = searchedResult;
                  
        },
      ),
      body: SafeArea(
        child: GetBuilder<StudentController>(
          init: StudentController(),
        //  valueListenable: studentlistNotifier,
          builder: (controller) {
            if (studentList.isEmpty) {
              return const NoStudentWidget();
            } else {
              return isGridViewNotifier.value
                  ? GridViewWidget(
                      studentList: studentList,
                    )
                  : ListViewWidget(
                      studentList: studentList,
                    );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddDetails()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

deleteAlert(BuildContext context, int id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to delete?'),
          actions: [
            TextButton(
                onPressed: () {
                  //deleteStudent(id);
                  Get.put(StudentController());
                  Get.find<StudentController>().deleteController(id);
                  Navigator.of(context).pop();
                },
                child: const Text('YES')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('NO')),
          ],
        );
      });
}

editAlert(BuildContext context, int id, String name, String age, String place,
    String mobile, Uint8List image) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Do you want to edit?'),
          actions: [
            TextButton(
                onPressed: () {
                  editStudent(id, name, age, place, mobile, image);
                  Navigator.of(context).pop();
                },
                child: const Text('YES')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('NO')),
          ],
        );
      });
}

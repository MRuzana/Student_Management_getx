import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:student_record_getx/functions/db_functions.dart';
import 'package:student_record_getx/model/data_model.dart';

class StudentController extends GetxController{

   //List<StudentModel> studentList =[];
   var studentList = <StudentModel>[].obs;
  void addStudentController(StudentModel student){
    addstudent(student);
    update();
  }

  void editStudentController(
    int id,
    String name,
    String age,
    String place,
    String mobile,
    Uint8List image,
  )
  {
    editStudent(id, name, age, place, mobile, image);
    update();
  }

  void deleteController(int id){
    deleteStudent(id);
    update();
  }

  Future<void> getAllStudentController()async{
    List<StudentModel> studentList =[];
    studentList =  await getAllStudents();
    update();
  }

  Future<List<StudentModel>> searchController(String searchText)async{
  
   studentList.value = await searchPersons(searchText);
    update();
    return studentList;
  
  }
}  
    
  
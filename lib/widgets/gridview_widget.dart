import 'package:flutter/material.dart';
import 'package:student_record_getx/model/data_model.dart';
import 'package:student_record_getx/screens/edit_profile.dart';
import 'package:student_record_getx/screens/screen_list_details.dart';
import 'package:student_record_getx/screens/screen_profile.dart';

class GridViewWidget extends StatelessWidget {
  final List<StudentModel>studentList;
  const GridViewWidget({
    super.key,required this.studentList
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    
      gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
       
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 220
      
        ),
        padding: const EdgeInsets.all(10),
      itemBuilder: (context,index){
        final data = studentList[index];
        return  GestureDetector(
          onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profile(
               studentModel: studentList[index],
              )));
            
          },
          child: GridTile(
            child: Container(
              color: Colors.grey,
              
              child:   Column(
                children: [
                   Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child:  CircleAvatar(
                      backgroundImage:MemoryImage(data.image!),
                      radius: 40,
                    ),
                  ),
                   Text(data.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
                   Text(data.age,
                  style:const  TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => EditProfile(studentModel: studentList[index])
                            )
                          );
                      }, icon: const Icon(Icons.edit,color: Colors.white,)),
                      IconButton(onPressed: (){
                        deleteAlert(context, studentList[index].id!);
                        
                      }, icon: const Icon(Icons.delete,color: Colors.red,)),
                    ],
                  ),
                ]
              ),
            ), 
          ),
        );
      },
      itemCount: studentList.length,
                  
    );
  }
}
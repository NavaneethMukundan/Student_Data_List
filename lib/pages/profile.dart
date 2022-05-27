import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/DataBase/function.dart';
import 'package:flutter_application_2/DataBase/model.dart';
import 'package:flutter_application_2/pages/details.dart';
import 'package:flutter_application_2/pages/edit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllDetails();
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.white,
              Color.fromARGB(255, 120, 166, 245),
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext context, List<StudentModel> studentList,
                Widget? child) {
              return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = studentList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            MemoryImage(const Base64Decoder().convert(
                          data.image.toString(),
                        )),
                      ),
                      title: Text(data.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>EditScreen(student: studentList[index],)));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteStudentData(index);
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return DetailsScreen(
                             studentModel: data,);
                        }));
                      },
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: studentList.length);
            },
          ),
        ),
      ),
    ));
  }
}

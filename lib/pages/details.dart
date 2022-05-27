import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/DataBase/model.dart';
import 'package:flutter_application_2/pages/home.dart';

class DetailsScreen extends StatelessWidget {
  final StudentModel studentModel;

  const DetailsScreen({super.key, required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.white,
                Colors.blueAccent,
              ]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: MemoryImage(const Base64Decoder().convert(
                      studentModel.image.toString(),
                    )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Name : ${studentModel.name}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Age : ${studentModel.age}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Class : ${studentModel.classs}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'School :${studentModel.school}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (ctx) => const HomeScreen()));
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        size: 40,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

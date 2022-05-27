// ignore_for_file: unused_element, unused_local_variable, avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/DataBase/function.dart';
import 'package:flutter_application_2/DataBase/model.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _formkey = GlobalKey<FormState>();
String image = '';
final _nameController = TextEditingController();
final _ageController = TextEditingController();
final _classController = TextEditingController();
final _schoolController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Image.asset('Assets/Images/form img.jpg'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Fill The Form',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Value is Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Age'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Value is Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _classController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Class'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Value is Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _schoolController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: 'School'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Value is Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            pickImage();
                          },
                          child: const Text('Add Image')),
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              whenButtonClicked();
                            } else {
                              const Text('Data is Empty');
                            }
                          },
                          icon: const Icon(Icons.verified_sharp),
                          label: const Text('Confirm'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> whenButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final classs = _classController.text.trim();
    final school = _schoolController.text.trim();
    if (name.isEmpty ||
        age.isEmpty ||
        classs.isEmpty ||
        school.isEmpty ||
        image.isEmpty) {
      return;
    } else {
      final student = StudentModel(
          name: name, age: age, classs: classs, school: school, image: image);
      addStudentList(student);
    }
  }

  ImagePicker picker = ImagePicker();
  Future<void> pickImage() async {
    final imagePicker =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicker == null) {
      return;
    } else {
      final bytes = File(imagePicker.path).readAsBytesSync();
      image = base64Encode(bytes);
    }
  }
}

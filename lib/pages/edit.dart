import 'package:flutter/material.dart';
import 'package:flutter_application_2/DataBase/model.dart';


class EditScreen extends StatefulWidget {
  final StudentModel student;
  const EditScreen({required this.student, Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}
 final _nameEditingController = TextEditingController();
 final _ageEditingController = TextEditingController();
 final _classEditingController = TextEditingController();
 final _schoolEditingController = TextEditingController();

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    _nameEditingController.text = widget.student.name;
    _ageEditingController.text = widget.student.age;
    _classEditingController.text = widget.student.classs;
    _schoolEditingController.text = widget.student.school;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: 
            [Column(
              children: [
                AppBar(
                  title: const Text('Edit'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('Assets/Images/edit.jpg', height: 290),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _ageEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _classEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _schoolEditingController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              widget.student.name= _nameEditingController.text;
                              widget.student.age= _ageEditingController.text;
                              widget.student.classs= _classEditingController.text;
                              widget.student.school= _schoolEditingController.text;
                              widget.student.save();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.save),
                            label: const Text('Save')),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

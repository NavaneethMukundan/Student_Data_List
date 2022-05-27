// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:flutter_application_2/DataBase/function.dart';
import 'package:flutter_application_2/DataBase/model.dart';
import 'package:flutter_application_2/pages/details.dart';

ValueNotifier<List<StudentModel>> temp = ValueNotifier([]);

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: 
          TextField(
                  decoration: const InputDecoration(
                   
                    prefixIcon: Icon(Icons.search, color: Colors.white,),
                    hintText: 'Search',hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (String? value) {
                    if (value == null || value.isEmpty) {
                      temp.value.addAll(studentListNotifier.value);
                      temp.notifyListeners();
                    } else {
                      temp.value.clear();
                      for (StudentModel item in studentListNotifier.value) {
                        if (item.name
                            .toLowerCase()
                            .contains(value.toLowerCase())) {
                          temp.value.add(item);
                        }
                        temp.notifyListeners();
                      }
                    }
                  },
                  controller: searchController,
                ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        // ignore: sort_child_properties_last
        child: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: temp,
              builder: (BuildContext ctx,
                  List<StudentModel > userData, Widget? child) {
                return ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = userData[index];
                      return ListTile(
                        leading: Text(data.name),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx)=> DetailsScreen(studentModel: data)));
                        },
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: userData.length);
              },
            )),
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
      ),
    );
  }
}

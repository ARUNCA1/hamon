import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:softus/config/url.dart';
import 'package:softus/pages/indivstd.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  var studArray;
  @override
  void initState() {
    viewStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            studArray == null
                ? Container(
                    height: 120.0,
                    width: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/2.gif'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: studArray.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.green[100],
                            child: ListTile(
                              onTap: (() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            StudDetail(
                                                studArray[index]["email"],
                                                studArray[index]["age"]
                                                    .toString(),
                                                studArray[index]["name"])));
                              }),
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  studArray[index]["name"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Age: " +
                                    studArray[index]["age"].toString()),
                              ),
                            ));
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  viewStudents() async {
    final response = await http.get(Uri.parse(studURL));

    if (response.statusCode == 200) {
      String data = response.body;
      log(data);
      setState(() {
        studArray = jsonDecode(data)["students"];
      });
    } else {
      throw Exception('Failed to load album');
    }
  }
}

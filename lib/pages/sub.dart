import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:softus/config/url.dart';
import 'package:softus/pages/indsub.dart';


class Subject extends StatefulWidget {
 
  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
 
 var subArray;
  @override
  void initState() {
   
    viewSub();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          subArray==null?Container(
      height: 120.0,
      width: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'asset/2.gif'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    ):

          Expanded(
            child: ListView.builder(
              itemCount:subArray.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green[100],
                  child: ListTile(
                    onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Indsub(subArray[index]["name"],"Teacher: " +subArray[index]["teacher"].toString())));

                
                    },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(subArray[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Teacher: " +subArray[index]["teacher"].toString()),
                  ),
                ));
              },
            ),
          )
        ],),
      ),
    );
  }

  viewSub() async {
  final response = await http
      .get(Uri.parse(subjectURL));

  if (response.statusCode == 200) {

    String data= response.body;
    log(data);
    setState(() {
     subArray=jsonDecode(data)["subjects"];
      
    });

    
  } else {
    
    throw Exception('Failed to load album');
  }
}
}
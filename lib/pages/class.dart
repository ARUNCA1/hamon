import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:softus/config/url.dart';
import 'package:softus/pages/layoutclss.dart';

class Cls extends StatefulWidget {
  @override
  State<Cls> createState() => _ClsState();
}

class _ClsState extends State<Cls> {
 // const ({ Key? key }) : super(key: key);
 var clsArray;
 @override
  void initState() {
   
    viewCls();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          clsArray==null?Center(
            child: Container(
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
    ),
          ):

          Expanded(
            child: ListView.builder(
              itemCount: clsArray.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green[100],
                  child: ListTile(
                    onTap: (() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Layout(
                        clsArray[index]["id"].toString(),clsArray[index]["layout"].toString(),clsArray[index]["size"])));

                    }),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(clsArray[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Hall: " +clsArray[index]["layout"].toString()),
                  ),
                ));
              },
            ),
          )
        ],),
      ),
      
    );
  }
   viewCls() async {
  final response = await http
      .get(Uri.parse(clsURL));

  if (response.statusCode == 200) {

    String data= response.body;
    log(data);
    setState(() {
      clsArray=jsonDecode(data)["classrooms"];
      
    });

    
  } else {
    
    throw Exception('Failed to load album');
  }
}
}

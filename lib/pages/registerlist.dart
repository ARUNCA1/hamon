import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:softus/config/url.dart';
import 'package:softus/pages/home.dart';



class Reg extends StatefulWidget {
  const Reg({ Key? key }) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  var  regArray;
  @override
  void initState() {
   viewReg();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title:  Text("Register list",style: TextStyle(fontSize: 14),),leading: BackButton(
        
          onPressed: (() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Home()));

                   
          }),
     color: Colors.black
   ), ),
      
     body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
         regArray==null?Container():

          Expanded(
            child: ListView.builder(
              itemCount: regArray.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.green[100],
                  child: ListTile(
                    onTap: (() {
                     //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>StudDetail(studArray[index]["email"],studArray[index]["age"].toString(),studArray[index]["name"])));

                    }),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("student id :"+regArray[index]["student"].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( "subject id :"+regArray[index]["subject"].toString()),
                  ),

                  trailing: Column(children: [
                   IconButton(onPressed:(){
                    showMyDialog( regArray[index]["id"].toString());

                   
                   }, icon: Icon(Icons.delete))
                  ],),
                ));
              },
            ),
          )
        ],),
      ),
 
    );
  }
   viewReg() async {
  final response = await http
      .get(Uri.parse(regURL));

  if (response.statusCode == 200) {

    String data= response.body;
   
    log("data"+data);
    setState(() {
     
     regArray=jsonDecode(data)["registrations"];
      
    });

    
  } else {
    
    throw Exception('Failed to load album');
  }
   }
   deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse(mainURL+"registration/"+id.toString()+"?api_key=1aBFb"),
    
  );
   String data=response.body;
   log(data);
   if (response.statusCode==200) {
    log(data);
    Fluttertoast.showToast(msg: "Deleted");
    viewReg();
     
   } else {
   }
 
}
 showMyDialog(String id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.green[200],
        title: Text('Delete'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Are u sure?.'),
              //Text('Would you like to confirm this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
               deleteAlbum(id);
              print('Confirmed');
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  
}
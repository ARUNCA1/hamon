import 'dart:convert';
import 'dart:developer';



import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softus/config/url.dart';
import 'package:http/http.dart' as http;
import 'package:softus/pages/home.dart';
import 'package:softus/pages/registerlist.dart';

class Layout extends StatefulWidget {
  final String ?id;
  final String ?name;
   final int size;
  

  const Layout(this.id,this.name,this.size) ;
 

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var clsArray;
  var subArray;
  var studArray;
  List assignedArray = [];
   List<DropdownMenuItem<String>> filterSub= [];
  
  String? dropdownValue;

  String? dropdownValueStudent;
   List<DropdownMenuItem<String>> filterStud= [];
    List studAssignedArray = [];


  @override
  void initState() {
   viewCls();
    viewSub();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double widt=MediaQuery.of(context).size.width;
     double hight=MediaQuery.of(context).size.height;
    return Scaffold(
      
        appBar: AppBar(
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Reg()));

        }, icon: Icon(Icons.list,size: 25,))
        
       ],
        leading: BackButton(
          onPressed: (() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Home()));

                   
          }),
     color: Colors.black
   ), 
  title: Text(widget.name!,style: TextStyle(fontSize: 14),),
      ),

      body:
      clsArray==null?Container():
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
             clsArray==""?Container():
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                //color: Colors.blue[100],
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('If u need change subject ?',style: TextStyle(),),
                )),
              ),

              //dropdown

               Row(
                 children: [
                   Expanded(
                     child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton<String>(
                                            underline: Container(),
                                            isExpanded: true,
                                            hint: Text('Select Sub'),
                                            value: dropdownValue,
                                            iconSize: 30,
                                            elevation: 16,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                                //print("Selected $_priority");
                                              });
                                            },
                                            items: filterSub),
                                      ),
                                    ),
                                  ),
                   ),
                     Expanded(
                       child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                     //    width: widt,
                                         child: ElevatedButton(
                            child: const Text('Add'),
                            onPressed: (){
                              if (clsArray=="") {
                                Fluttertoast.showToast(msg: "select sub");
                              } else {
                              }
                             updateSubject();
                            },
                             style: ElevatedButton.styleFrom(
                                     primary: Colors.green,
                                    
                                     textStyle: TextStyle(
                                    
                                     fontWeight: FontWeight.bold)),
                            
                          ),
                                       ),
                                     ),
                                   ),
                     ),
                 ],
               ),

                clsArray==""?Container():
                           Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton<String>(
                                      underline: Container(),
                                      isExpanded: true,
                                      hint: Text('Select student'),
                                      value: dropdownValueStudent,
                                      iconSize: 30,
                                      elevation: 16,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValueStudent = newValue!;
                                          //print("Selected $_priority");
                                        });
                                      },
                                      items: filterStud),
                                ),
                              ),
                            ),
                          
                        
              
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                height: 300,
                 child: Row(
                   children: [
                    Container(
                      width: 50,
                      height: 80,
                      child: Card(
                        color: Colors.pink[100],
                        child: Center(child: Text("T")),
                      ),
                    ),
                    widget.name=="conference"?
                     Expanded(
                       child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             child: GridView.builder(
                              scrollDirection: Axis.vertical,
                                physics:ScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 12,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing:90,
                                ),
                                itemCount:widget.size.isEven? 24:21,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.green[100],
                                    child: Center(child: Text(" s")),
                                  );
                                },
                              ),
                           ),
                         ),
                       ),
                     ): Expanded(
                       child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                                physics:ScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing:2,
                                ),
                                itemCount:widget.size.isEven? 24:21,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.green[100],
                                    child: Center(child: Text(" s")),
                                  );
                                },
                              ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
               Expanded(child: Container(),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widt,
                    child: ElevatedButton(
                          child: const Text('Register'),
                          onPressed: (){

                            if (dropdownValueStudent=="Select student") {
                              Fluttertoast.showToast(msg: "Select Student");
                            } 
                            else if (clsArray=="") {

                              Fluttertoast.showToast(msg: "Select Sub");
                            }
                            else {
                              register();
                            }
                          
                          },
                           style: ElevatedButton.styleFrom(
                primary: Colors.green,
               
                textStyle: TextStyle(
               
                fontWeight: FontWeight.bold)),
                          
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
      
    );
  }

  viewCls() async {
  var id=widget.id;
  log("id"+widget.id.toString());
     var params = {
     "id":id.toString(),
       //"layout":"conference",
       //S"name":"SlateGray",
       //"size":"17",
      //"subject":"HiS"
      
    };
    

    Uri uri = Uri.parse(mainURL+"classrooms/"+id.toString()+"?api_key=1aBFb");
    uri.replace(queryParameters: params);
  final response = await http
      .get(uri,);

  if (response.statusCode == 200) {

    String data= response.body;
    log(data);
    setState(() {
      clsArray=jsonDecode(data)["subject"];

      
    });
   

    
  } else {
    
    throw Exception('Failed to load album');
  }
}
 viewSub() async {
  final response = await http
      .get(Uri.parse(subjectURL));
     String data= response.body;
      subArray=jsonDecode(data)["subjects"];
    log(data);
  if (response.statusCode == 200) {
  log("hhhhhhhhhh");

    log(data);
    setState(() {
    
       for (var i = 0; i < subArray.length; i++) {
         filterSub.add(DropdownMenuItem(
            child: Text(subArray[i]['name']),
            value: subArray[i]['id'].toString(),
          ));
        
      
    
       }}
    
    );
    
      viewStudents() ;

    
  } else {
    
    throw Exception('Failed to load album');
  }
}
viewStudents() async {
  final response = await http
      .get(Uri.parse(studURL));

  if (response.statusCode == 200) {

    String data= response.body;
    log(data);
    setState(() {
      studArray=jsonDecode(data)["students"];
      studAssignedArray=
           studArray.map<int>((m) => m['id'] as int).toList();
        print(studAssignedArray);
      
    });
    int i = 0;
      for (i = 0; i < studAssignedArray.length; i++) {
        var item = studArray.where((oldValue) =>
           studAssignedArray[i] == (oldValue['id']));
        print("Picked Item is : " +
            item
                .map<String>((m) => m['name'] as String)
                .toList()
                .toString());
        filterStud.add(DropdownMenuItem(
            value:  studAssignedArray[i].toString(),
            child: Text(item
                .map<String>((m) => m['name'] as String)
                .toList()
                .toString()
                .replaceAll(RegExp("[\\[\\]]"), "",),style: TextStyle(fontSize: 11),)));}

    
  } else {
    
    throw Exception('Failed to load album');
  }
}


  register()async{
    print("kkkkk"+dropdownValue!);
    http.Response response=await http.post( Uri.parse(regURL),body: {
      "id":widget.id,
      "student":dropdownValueStudent==null?"":dropdownValueStudent,
       "subject":dropdownValue==null?"":dropdownValue
      
    } );

    // String data=response.body;
    //         log(
    //   'data'+data
    //  );
      
    if (response.statusCode==200) {
        String data=response.body;
          Fluttertoast.showToast(msg: "added",
          textColor: Colors.white,);
    
    
     log(
      'data'+data
     );
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Home()));

    
    } else {
        Fluttertoast.showToast(msg: "already added",
          textColor: Colors.white,);
       throw Exception('Failed to load album');
       
    }
  }

  updateSubject()async{
      log(dropdownValue!);
      String url = mainURL+"classrooms/"+widget.id.toString()+"?api_key=1aBFb";
  
    http.Response response=await
       http.patch(
    Uri.parse( url) ,
      body: {
        "id": widget.id,
        "subject":dropdownValue==null?"":dropdownValue
      },
     // headers: {"Authorization": "JWT $authToken"},
    );
    if (response.statusCode == 200) {
      String data =response.body;
      log("data"+data);
        log(dropdownValue!);
         Fluttertoast.showToast(msg: "subject added",
          textColor: Colors.white,);
          viewCls();

      
    } else {
    }
  
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:softus/pages/class.dart';
import 'package:softus/pages/student.dart';
import 'package:softus/pages/sub.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   PageController controller=PageController();
  //const Home({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
        showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                backgroundColor: Colors.green[200],
                title: Text('Warning'),
                content: Text('Are you sure to exit ?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('No')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        exit(0);
                      },
                      child: Text('Yes'))
                ],
              );
            });
        return true;
      },
      child: Scaffold(
        
         bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            controller.jumpToPage(value);
          }),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          
         
          icon: Icon(Icons.person),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Subject',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.class_),
          label: 'Room',
        ),
      ],
      ),
    
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.school,color: Colors.white,),onPressed: (){},iconSize: 32,),
          title: Text("Home",style: TextStyle(fontSize: 13),),
          actions: [
            
          ],
        ),
        body: PageView(
          children: [
    
            Student(),
            Subject(),
            Cls()
          ],
            scrollDirection: Axis.horizontal,
           
            // reverse: true,
            // physics: BouncingScrollPhysics(),
            controller: controller,
            onPageChanged: (num){
           
          },
        ),
        
      ),
    );
  }
}
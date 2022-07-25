import 'package:flutter/material.dart';
import 'package:softus/pages/home.dart';

class StudDetail extends StatefulWidget {
  final String? email;
  final String? age;
  final String? name;

  const StudDetail(this.email, this.age, this.name);
  @override
  State<StudDetail> createState() => _StudDetailState();
}

class _StudDetailState extends State<StudDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
            onPressed: (() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            }),
            color: Colors.black),
        title: Text(
          "Student",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(100)
                    //more than 50% of width makes circle
                    ),
                height: 150,
                width: 400,
                child: Card(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black12,
                      width: 2.0,
                    ),
                  ),
                  color: Colors.green[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.name!,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Age : " + widget.age!,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.email!,
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

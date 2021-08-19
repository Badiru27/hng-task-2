import 'package:flutter/material.dart';


class Display extends StatefulWidget {
  final String emailController;
  final String nameController;
  final String trackController;
  const Display({this.nameController, this.emailController, this.trackController='no track'});


  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Text(widget.nameController,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87
            ),),
            SizedBox(height:30),
            Text(widget.emailController,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87
              ),),
            SizedBox(height:30),
            Text(widget.trackController,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87
              ),),
            SizedBox(height:50),
            Container(
              color: Colors.blueAccent,
              child: MaterialButton(
                minWidth: 250,
                onPressed : (){
                 Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text("Try Again",
                  style: TextStyle(
                    fontSize: 18,
                  ),),),)
          ],
        ),
      ),
    );
  }
}

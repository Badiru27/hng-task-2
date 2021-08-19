import 'package:flutter/material.dart';
import 'package:hng_task_2/display.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://hng.tech/';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String trackController;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100),
                          Image(image: AssetImage('assets/hng.png')),
                          SizedBox(height: 10),
                          GestureDetector(child: Text('https://hng.tech/'),
                          onTap: _launchURL),
                          SizedBox(height: 30),
                          Text('Full Name',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18
                          ),),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: nameController,
                          validator: (value) => (value.length == 0 ? 'Please enter your name': null),
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintText: ('Enter your name'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none
                              )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EMAIL',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18
                            ),),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            validator:  (value) => (value.length == 0 ? 'Please enter your email': null),
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: ('Enter your email'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none
                                )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      DropdownButton(
                        hint: Text('Track'),
                        items: ['Mobile', 'Front-end', 'UI/UX', 'Backend'].map((String value)
                        {
                          return DropdownMenuItem(
                            value: value,
                              child:Text(value),);
                        }).toList(),
                        onChanged: (String value){
                          setState(() {
                            trackController = value;
                          });
                        },
                        value: trackController,
                      ),
                      SizedBox(height: 50),

                    ],
                  ),
                ),
                Container(
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    minWidth: 250,
                    onPressed : (){
                      if(_formkey.currentState.validate()){
                        onSaved();
                        _formkey.currentState.reset();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text("Submit",
                      style: TextStyle(
                        fontSize: 18,
                      ),),),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSaved(){
    Navigator.push(context,
        MaterialPageRoute(
            builder:(context)=> Display(
                nameController:nameController.text,
                emailController:emailController.text,
                trackController: trackController
            )));

  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

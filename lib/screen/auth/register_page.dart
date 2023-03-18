
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_task/screen/auth/login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

 var loder=false;

 var auth=FirebaseAuth.instance;

  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  File ? imagefile;
  ImagePicker imagePicker = ImagePicker();
  String? imagepath;

  void takePhoto (ImageSource source)async{
    final picarimagefile= await imagePicker.getImage(source:source,imageQuality: 80);
    setState(() {
      imagefile= File(picarimagefile!.path);
    });

    Reference reference=FirebaseStorage.instance.ref().child(DateTime.now().toString());
    await reference.putFile(File(imagefile!.path));
    reference.getDownloadURL().then((value){
      setState(() {
        imagepath=value;
        print("Image Link....${imagepath}");
      });

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Stack(
              alignment: Alignment.center,
              children: [
                imagefile !=null? CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: FileImage(File(imagefile!.path)),
                ):CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.amberAccent.withOpacity(0.3),),

                Padding(
                  padding: const EdgeInsets.only(left: 95,top: 35),
                  child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (_){
                              return AlertDialog(
                                title: Text("Uplod a Photo"),
                                content:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: (){
                                          takePhoto(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Camera")),
                                    SizedBox(width: 10,),
                                    TextButton(
                                        onPressed: (){
                                          takePhoto(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Gallary"))
                                  ],
                                ),
                              );
                            });

                      },
                      child: Icon(Icons.camera_alt,size: 30,color: Colors.grey,)),
                )

              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    filled: true,
                    fillColor: Color(0xff9CA3AF),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Color(0xffE6E7E9),)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Color(0xffE6E7E9),
                            width: 1
                        )
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: TextField(
                  controller: phone,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    filled: true,
                    fillColor: Color(0xff9CA3AF),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Color(0xffE6E7E9),)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Color(0xffE6E7E9),
                            width: 1
                        )
                    ),
                    prefixIcon: Icon(Icons.call),
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Color(0xff9CA3AF),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Color(0xffE6E7E9),)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Color(0xffE6E7E9),
                            width: 1
                        )
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),

                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: TextField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xff9CA3AF),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color:Color(0xffE6E7E9),)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(
                            color: Color(0xffE6E7E9),
                            width: 1
                        )
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),

                ),
              ),
            ),
            SizedBox(height: 35,),
            InkWell(
              onTap: (){
                register();

              },
              child:loder?Center(child: CircularProgressIndicator(color: Colors.deepPurple,),): Container(
                height:50,
                width: 256,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff32B768)
                ),
                child: Center(
                  child:Text("Register",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color:Color(0xffffffff), fontSize: 14,fontWeight: FontWeight.bold),
                    ),) ,
                ),
              ),
            ),


          ],
        ),
      )
    );
  }

  Future register() async{

    try{
      setState(() {
        loder=true;
      });

      final user= await auth.createUserWithEmailAndPassword(
          email:email.text ,
          password: password.text
      );
      userdetels();

      Fluttertoast.showToast(
          msg: "successful register",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));

      setState(() {
        loder=false;
      });



    }on FirebaseAuthException catch(error){


      setState(() {
        Fluttertoast.showToast(
            msg: "${error.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        loder=false;
      });
    }
  }
 Future userdetels()async{
   await FirebaseFirestore.instance.collection("user").add(
       {
         "name": name.text,
         "email":email.text,
         "uid":auth.currentUser!.uid,
         "phone":phone.text,
         //  "photo":_auth.currentUser!.photoURL,
         "photo":imagepath ??"",

       });
 }
}
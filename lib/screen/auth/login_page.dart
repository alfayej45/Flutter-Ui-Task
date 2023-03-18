import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_task/screen/homepage/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var loder=false;

  var auth=FirebaseAuth.instance;

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

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
              login();
            },
            child:loder?Center(child: CircularProgressIndicator(color: Colors.deepPurple,),): Container(
              height:50,
              width: 256,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff32B768)
              ),
              child: Center(
                child:Text("Login",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color:Color(0xffffffff), fontSize: 14,fontWeight: FontWeight.bold),
                  ),) ,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future login() async{

    try{
      setState(() {
        loder=true;
      });

      await auth.signInWithEmailAndPassword(
          email:email.text ,
          password: password.text);

      Fluttertoast.showToast(
          msg: "successful login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
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
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_task/screen/auth/login_page.dart';
import 'package:flutter_ui_task/screen/auth/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CredentialPage extends StatelessWidget {
  const CredentialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SvgPicture.asset("assets/Order Success.svg",height: 178,width: 300,),
          ),
          SizedBox(height: 25,),
          Text("Welcome",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 24,fontWeight: FontWeight.bold),
            ),),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Before enjoying Foodmedia services Please register first",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color:Color(0xff1F2937),fontSize: 12,fontWeight: FontWeight.normal),
              ),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterPage()));
            },
            child: Container(
              height:50,
              width: 256,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff32B768)
              ),
              child: Center(
                child:Text("Create Account",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color:Color(0xffffffff), fontSize: 14,fontWeight: FontWeight.bold),
                  ),) ,
              ),
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
            },
            child: Container(
              height:50,
              width: 256,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD1FAE5)
              ),
              child: Center(
                child:Text("Login",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color:Color(0xff10B981), fontSize: 14,fontWeight: FontWeight.bold),
                  ),),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
              children:[
                TextSpan(text: "By logging in or registering, you have agreed to", style: GoogleFonts.poppins(
                  textStyle: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.normal),
                ),),
                //hhhh
                TextSpan(text: " the Terms and Conditions ", style: GoogleFonts.poppins(
                  textStyle: TextStyle(color:Color(0xff32B768) ,fontSize: 12,fontWeight: FontWeight.normal),
                ),),
                TextSpan(text: " and", style: GoogleFonts.poppins(
                  textStyle: TextStyle(color:Colors.black ,fontSize: 12,fontWeight: FontWeight.normal),
                ),),
                TextSpan(text: " Privacy Policy.", style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color(0xff32B768),fontSize: 12,fontWeight: FontWeight.normal),
                ),),
              ]
            )),
          )
        ],
      ),
    );

  }
}

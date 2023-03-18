import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ScandPage extends StatelessWidget {
  const ScandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/Order illustration.svg",height: 270,width: 300,),
          SizedBox(height: 25,),
          Text("Select the Favorites Menu",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(color:Color(0xff1F2937),fontSize: 24,fontWeight: FontWeight.bold),
            ),),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Now eat well, don't leave the house,You can choose your favorite food only with one click",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color:Color(0xff1F2937),fontSize: 12,fontWeight: FontWeight.normal),
              ),
              textAlign: TextAlign.center,),
          ),
        ],
      ),
    );

  }
}

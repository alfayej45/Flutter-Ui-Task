import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/Safe Food.svg",height: 270,width:280 ,),
          SizedBox(height: 25,),
          Align(
            alignment: Alignment.center,
            child: Text("Good food at a cheap price",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color:Color(0xff1F2937),fontSize: 24,fontWeight: FontWeight.bold),
              ),),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("You can eat at expensive restaurants with affordable price",
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

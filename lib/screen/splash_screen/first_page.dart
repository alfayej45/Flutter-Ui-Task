import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SvgPicture.asset("assets/Tracking & Maps.svg",height: 178,width: 300,),
          ),
          SizedBox(height: 25,),
          Text("Nearby restaurants",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 24,fontWeight: FontWeight.bold),
            ),),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("You don't have to go far to find a good restaurant, we have provided all the restaurants that is near you",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color:Color(0xff1F2937),fontSize: 12,fontWeight: FontWeight.normal),
              ),
            textAlign: TextAlign.center,),
          ),
        ],
      ),
    );

  }
}

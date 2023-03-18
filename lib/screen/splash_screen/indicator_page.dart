import 'package:flutter/material.dart';
import 'package:flutter_ui_task/screen/auth/credentials_page.dart';
import 'package:flutter_ui_task/screen/splash_screen/first_page.dart';
import 'package:flutter_ui_task/screen/splash_screen/scand.dart';
import 'package:flutter_ui_task/screen/splash_screen/third_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../homepage/home_page.dart';
class IndicatorPage extends StatefulWidget {
  const IndicatorPage({Key? key}) : super(key: key);

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  var change=0;
  PageController controller=PageController();
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Skip",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color:Color(0xff4B5563), letterSpacing: 2,fontSize: 16,fontWeight: FontWeight.bold),
                ),),
              SmoothPageIndicator(
                controller: controller,
                count:  3,
                axisDirection: Axis.horizontal,
                effect:WormEffect(
                  activeDotColor: Color(0xff32B768)
                ),
              ),
              InkWell(
                onTap: (){
                  if(change==2)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CredentialPage()));
                    }
                  else{
                    controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                  }
                },
                  child: Icon(Icons.arrow_forward,size: 25,color:Color(0xff32B768) ,))
            ],
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value){
          setState(() {
            change=value;
          });

        },
        children: [
           FirstPage(),
          ScandPage(),
          ThirdPage()
        ],
      ),
    );
  }
}

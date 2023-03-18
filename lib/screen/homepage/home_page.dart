import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var changevalue=0;

  List tab=[
    "assets/Frame.png",
    "assets/Frame (1).png",
    "assets/Frame (2).png"
  ];

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
   backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        title:Row(
          children: [
            Icon(Icons.location_on,size: 16,color: Color(0xff32B768),),
            Text("Agrabad 435, Chittagong",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 13,fontWeight: FontWeight.normal),
              ),),
          ],
        ) ,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Image(image: AssetImage("assets/unnamed.png"),height: 15,width: 17,color: Colors.grey,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: CircleAvatar(
              radius: 14,
             backgroundImage: AssetImage("assets/scandman.jpg"),

            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height*0.1,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            itemExtent: 125,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  setState(() {
                    changevalue=index;
                    if(changevalue==2)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage()));
                      }
                  });
                },
                child: Image(image: AssetImage(tab[index]),
                  color:changevalue==index?Color(0xff32B768):Colors.black,),
              );
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
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
                    prefixIcon: Icon(Icons.search),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Today New Arivable",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                        ),),
                      SizedBox(height: 7),
                      Text("Best of the today food list update",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff6B7280), fontSize: 13,fontWeight: FontWeight.normal),
                        ),),

                    ],
                  ),
                  Row(
                    children: [
                      Text("See All",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff6B7280), fontSize: 14,fontWeight: FontWeight.normal),
                        ),),
                      SizedBox(width: 7,),
                      Icon(Icons.arrow_forward_ios,color:Color(0xff6B7280),size: 15,)

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: size.height*0.32,
              child: ListView.builder(
                itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: size.height*0.33,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.2)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   height: size.height*0.2,
                            //   width: 180,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25)),
                            //     image: DecorationImage(image: AssetImage("assets/cooking3.jpg"),fit: BoxFit.fill)
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius:BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25)),
                                child: Image(image: AssetImage("assets/Mask Group.png"),fit: BoxFit.fill,height: 110,width: size.width,),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:15 ),
                              child: Text("Sauce Tonkatsu",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                                ),),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(Icons.location_on,size: 16,color: Color(0xff32B768),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Ambrosia Hotel & Restaurant",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 13,fontWeight: FontWeight.normal),
                                    ),),
                                ),
                              ],
                            ) ,



                          ],

                        ),

                      ),
                    );
                  }),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore Restaurant",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                        ),),
                      SizedBox(height: 7),
                      Text("Check your city Near by Restaurant",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff6B7280), fontSize: 13,fontWeight: FontWeight.normal),
                        ),),

                    ],
                  ),
                  Row(
                    children: [
                      Text("See All",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff6B7280), fontSize: 14,fontWeight: FontWeight.normal),
                        ),),
                      SizedBox(width: 7,),
                      Icon(Icons.arrow_forward_ios,color:Color(0xff6B7280),size: 15,)

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListView.builder(
              itemCount: 5,
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (contex,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    child: Container(
                      height: size.height*0.2,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.2)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius:BorderRadius.circular(15),
                              child: Image(image: AssetImage("assets/Rectangle 387.png"),fit: BoxFit.cover,height: 100,width:110,),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Ambrosia Hotel & Restaurant",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                                ),),
                              Row(
                                children: [
                                  Icon(Icons.location_on,size: 18,color: Color(0xff32B768),),
                                  Text("kazi Deiry, Taiger Pass \nChittagong",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 11,fontWeight: FontWeight.normal),
                                    ),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: Container(

                                      height: 38,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xff32B768)
                                      ),
                                      child: Center(
                                        child:Text("Book",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(color:Color(0xffffffff), fontSize: 15,fontWeight: FontWeight.normal),
                                          ),) ,
                                      ),
                                    ),
                                  )
                                ],
                              ) ,
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../helper/helpernote.dart';
import 'homeScreen.dart';
class DisScreen extends StatefulWidget {




  @override
  _DisScreenState createState() => _DisScreenState();
}

class _DisScreenState extends State<DisScreen> {
  String? name,discription,date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(

        title:Text("Student Details",style: TextStyle(color:textcolor,fontSize: fonttitle),
        ),shadowColor:graytext,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
      ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios,size:iconSize),),


        ],leading: Icon(Icons.star,size: iconSize,),
      ),
      body: Column(
        children: [
          TextFormField(
             keyboardType: TextInputType.name
            ,decoration: InputDecoration(
              labelText:"name",labelStyle: TextStyle(color: blue),
              hintText: "Enter your name",
              helperStyle: TextStyle(color: white),
            contentPadding:EdgeInsets.all(DPadding),
              fillColor:Colors.black12,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(RadiusCircular),
                    ),borderSide: BorderSide(color:black,width: 0.5 )
              ),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(RadiusCircular)),
                borderSide:BorderSide(color:textcolor,width:0.7)
              ),
            focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusCircular)),
            borderSide:BorderSide(color: blue,width:0.9)
            ),

          ),
            onChanged: (value){
               setState(() {
                 name=value;
               });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 8,
             decoration: InputDecoration(
              labelText: "Note",
              labelStyle: TextStyle(color:blue),
              hintText: "Enter Note",
                 contentPadding:EdgeInsets.all(DPadding),
              helperStyle: TextStyle(
                color: white
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
                    ,borderSide: BorderSide(color:textcolor,width:0.7)
              ),
    disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
    ,borderSide: BorderSide(color:textcolor,width:0.5)

            ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(RadiusCircular)),
    borderSide: BorderSide(color: blue,width:0.9 )
    )
          ),
            onChanged: (value){
              setState(() {
                discription=value;
              });
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
             keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  labelText: "Date Time",
                  labelStyle: TextStyle(color:blue),
                  hintText: "Enter Date Time",
                  contentPadding:EdgeInsets.all(DPadding),
                  helperStyle: TextStyle(
                      color: white
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
                      ,borderSide: BorderSide(color:textcolor,width:0.7)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
                      ,borderSide: BorderSide(color:textcolor,width:0.5)

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(RadiusCircular)),
                      borderSide: BorderSide(color: blue,width:0.9 )
                  )
              ),
              onChanged: (value){
               setState(() {
                 date=value;
               });
              },
          ),
          SizedBox(height: 10,),
          ElevatedButton.icon(onPressed: (){
            HelperNote().insertdb({
              "discription":"$discription",
              "name ":"$name",
              "date":"$date",
              "done":"0"

            }).then((value) {
              print("Successfully$value");
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }));
            });
          }, icon:Icon(Icons.add), label:Text("ADD",style: TextStyle(color: black),),style: ElevatedButton.styleFrom(primary:blue),)

        ],
      ),
    );
  }
}

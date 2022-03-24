import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../helper/helpernote.dart';
import 'discriptionscreen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      appBar: AppBar(
        
        title:Text("StudentList",style: TextStyle(color:textcolor,fontSize: fonttitle),
        ),shadowColor:graytext,shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(RadiusCircular))
    ),
    centerTitle: true,
    actions: [
      Icon(Icons.start,size:iconSize,),

    ],leading:IconButton(onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
        return DisScreen();
    }));
    }, icon: Icon(Icons.arrow_left_rounded),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DPadding),
            child: FutureBuilder(
              future:HelperNote().gettodo()
              ,builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasData){
                if(snapshot.data.length==null){
                  return Center(
                    child: Text("Todo List is Empty"),

                  );
                }else{
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: blue2,
                        shadowColor:black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: ListTile(
                          title: Text("${snapshot.data[index].title}",style: TextStyle(color: textcolor,fontSize:15,),
                          ),
                          subtitle: Text("${snapshot.data[index].date}",style: TextStyle(color:textcolor,fontSize:fontsubtitle  ),),
                          trailing: IconButton(onPressed: (){
                            HelperNote().deletetodo(snapshot.data[index].id).then((value) {
                              setState(() {
                                print("value$value");
                              });
                            });
                          },icon:Icon(Icons.delete,size:iconSize,color: red,),
                          ),
                          onTap: (){
                            print("hi");
                          },
                        ),

                      );
                    },);
                }
              }else{
                return CircularProgressIndicator(backgroundColor :primarycolor,valueColor: AlwaysStoppedAnimation<Color>(Colors.black),);
              }

            },),


          ),

        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
            return DisScreen();
          }));
        },child: Icon(Icons.add,color: textcolor,),

      ),
    );
  }
}

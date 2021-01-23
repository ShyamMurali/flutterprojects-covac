import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class _userclass{
  String username,report;
  _userclass(this.username,this.report){}
}
 List<_userclass> conformationList =List<_userclass>() ;

 class Readreports extends StatefulWidget {
     static const routename ='/readreports';
   @override
   _ReadreportsState createState() => _ReadreportsState();
 }
 
 class _ReadreportsState extends State<Readreports> {
   void work(){
  final dbreference = FirebaseDatabase.instance.reference();
  dbreference.child('reports').once().then((DataSnapshot data ){
    if(data != null){
     // print(data.value.keys);
 conformationList.clear();
  var keys = data.value.keys;
    var values = data.value;
    print(values.keys);
   for( var key in keys)
   {
      var  _data =_userclass(values[key]['name'].toString(),values[key]['report'].toString());
        conformationList.add(_data); 
     }

    }
    else print('data is empty');
   
  });
}
ListView generateItemsList() {
    return ListView.builder(
      itemCount: conformationList.length,
      itemBuilder: (context, index) {
        return Dismissible(
         key: Key(conformationList[index].username),
          child: InkWell(
              child: Card(
           elevation: 1,
           margin: EdgeInsets.only(bottom: 5,top:5,right:10,left:10),     
           child: ListTile(title: Text('${conformationList[index].report}',
           style: TextStyle(fontWeight: FontWeight.bold),),
           leading: Text('name : ${conformationList[index].username}'),
                ),
              )
              ),
        );
      },
    );
  }

 @override
 void initState(){
   super.initState();
  setState(() {
     work();
  });
 }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Read Illness Report'),
        backgroundColor: Colors.black,
      ),
      body: generateItemsList(),
      
    );
   }
 }

import 'package:flutter/material.dart';
import 'package:sqflite_again/Database_Helper.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final helper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(

              children: [

                TextField(
                 decoration: InputDecoration(hintText: "Insert Your ID"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Insert Your Name"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Insert Your Age"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Insert Your Email"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Insert Your Phone"),
                ),


              ],
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: _insert, child: Text('Insert Data'))
        ],
      ),




    );
  }



  void _insert() async{

    Map<String, dynamic> row ={
      DatabaseHelper.columnName: 'shawon',
      DatabaseHelper.columnNumber: '014151512',
      DatabaseHelper.columnId: '02',
      DatabaseHelper.columnEmail: 'fgfhfhfghfg',
    };
    final id = await helper.insert(row);
    print(id);
  }

}




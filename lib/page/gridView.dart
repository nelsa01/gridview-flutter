import 'dart:js';

import 'package:flutter/material.dart';

import './../main.dart';


class GridViewNum extends StatelessWidget{
  final numbers = List.generate(100, (index) => '$index');
  final controller =ScrollController();
  @override
  Widget build(BuildContext context) =>
    Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Grid view'),
        actions:[
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: (){
              final double value=0;
              controller.jumpTo(value);
            },
            ),
            IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: (){
              final  value=controller.position.maxScrollExtent;
              controller.jumpTo(value);
            },)
        ]
      ),
      body:buildGridView(),
      );

      Widget buildGridView()=> GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: 1 / 5,
          mainAxisSpacing:4,
          crossAxisSpacing:4,
        ),
        padding: EdgeInsets.all(4),
        controller:controller,
        itemCount: numbers.length,
        itemBuilder: (context, index){
          final item = numbers[index];
          return buildNumber(item);
        },
      );

      Widget buildNumber(String number) => Container(
        padding: EdgeInsets.all(16),
        color:Colors.orange,

        child: GridTile(
          header: Text(
          'header $number',
          textAlign: TextAlign.center,
        ),
        child: Center(
          child:Text(
            number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
            textAlign: TextAlign.center,
          ) ,
        ), 
        footer: Text(
          'footer $number',
        ),
        ),
      );
  
}
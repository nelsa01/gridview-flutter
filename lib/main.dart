import 'package:flutter/material.dart';
import 'package:gridView/page/datatable.dart';
// import 'package:gridView/page/gridView.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: DataTableUser(),
      // home: GridViewNum(),
    );
  }
}

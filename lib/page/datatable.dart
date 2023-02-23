import 'package:flutter/material.dart';
import './../page/user.dart';

class DataTableUser extends StatefulWidget{
  DataTableUser(): super();
  final String title = "data table flutter demo";
 
  @override 
  DataTableUserState createState() => DataTableUserState();
}

class DataTableUserState extends State<DataTableUser>{
  late List<User> users;
  late List<User> selectedUsers;
  late bool sort;

  @override
  void initState(){
    sort =false;
    selectedUsers=[];
    users =User.getUser();
    super.initState();
  }
   onSortColumn(int columnIndex, bool ascending){
    if (columnIndex==0){
      if(ascending){
        users.sort((a,b)=> a.firstName.compareTo(b.firstName));
      }else{
        users.sort((a,b)=> b.firstName.compareTo(a.firstName));
      }
    }
   }
   onSelectedRow(bool selected , User user) async{
    setState(() {
      if(selected){
      selectedUsers.add(user);
    }else{
      selectedUsers.remove(user);
    }
    });
    }
    deleteSelected() async{
      setState(() {
         if(selectedUsers.isNotEmpty){
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for(User user in temp){
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
      });
     
    }
  DataTable dataBody(){
   return  DataTable(
    sortAscending: sort,
    sortColumnIndex: 0,
    columns: [
      DataColumn(
        label: Text("First Name"),
        numeric:false, 
        tooltip: "this is the first name" ,
        onSort: (columnIndex,ascending){
          setState(() {
            sort=!sort;
          });
          onSortColumn(columnIndex,ascending);
        }
        ),
       DataColumn(
        label: Text("Last Name"),
        numeric:false, 
        tooltip: "this is the last name" 
        )
    ],
    rows: users.map(
      (user) => DataRow (
        selected:selectedUsers.contains(user),
        onSelectChanged: (b){
          print("onselected"); 
          onSelectedRow(b!, user);
        },
        cells: [
          DataCell(
            Text(user.firstName),
            onTap: (){
              print('Selected ${user.firstName}');
            }
          ),
          DataCell(
            Text(user.lastName)
          )
        ]
      )
      )
      .toList(),
   );
}  

@override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body:Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: dataBody()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children:<Widget> [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlinedButton(child: Text('selected ${selectedUsers.length}'),
                onPressed: () {} ,),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlinedButton(child: Text('delete selected ${selectedUsers.length}'),
                onPressed: () {
                  deleteSelected();
                } ,),
              )
            ],
          )
        ],

      ),
    );
  }
}



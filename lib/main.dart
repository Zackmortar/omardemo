import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: mainscaffold(),
    debugShowCheckedModeBanner: false,
  ));
}

class Client {
  Client({required this.ID, required this.Name, required this.ServiceID});
  String Name;
  String ID;
  String ServiceID;
}

var clientlist = <Client>[];

class mainscaffold extends StatefulWidget {
  @override
  State<mainscaffold> createState() => _mainscaffoldState();
}

class _mainscaffoldState extends State<mainscaffold> {
  createAlertDialog(BuildContext buildContext) {
    TextEditingController Namecontroller = new TextEditingController();
    TextEditingController IDcontroller = new TextEditingController();
    TextEditingController Servicecontroller = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("New client"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: Namecontroller,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "ID"),
                  controller: IDcontroller,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "ServiceID"),
                  controller: Servicecontroller,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      clientlist.add(Client(
                          ID: IDcontroller.text,
                          Name: Namecontroller.text,
                          ServiceID: Servicecontroller.text));
                    });
                    print("added item");
                    Navigator.of(context).pop();
                  },
                  child: Text("Create"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add item demo"), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              createAlertDialog(context);
              // createAlertDialog(context).then((onValue) {
              //   setState(() {
              //     clientlist.add(onValue);
              //   });
              // });
            },
            icon: Icon(Icons.add)),
      ]),
      body: Column(
        children: [
          for (var x in clientlist)
            Row(
              children: [
                Text("Name: " + x.Name),
                Text("ID: " + x.ID),
                Text("Service ID: " + x.ServiceID)
              ],
            )
        ],
      ),
    );
  }
}

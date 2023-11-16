// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:rest_ornek/Model/User_Model.dart";
import "../Services/Api_Service.dart";


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  List<UserModel>? userModel = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var users = await ApiService().getUser();
    setState(() {
      userModel = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: AppBar(title: const Text("RestApi Ornek"),),
    
    body: userModel == null || userModel!.isEmpty ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
      itemCount: userModel!.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(userModel![index].name),
          subtitle: Text(userModel![index].email),
        );
      },
    )
    );
  }
}

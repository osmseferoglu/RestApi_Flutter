// ignore_for_file: file_names, avoid_print
import 'dart:developer';
import 'package:rest_ornek/Constants.dart';
import 'package:rest_ornek/Model/User_Model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUser() async {
    try 
    { 

      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);

      if(response.statusCode == 200){
        List<UserModel> _model = userModelFromJson(response.body);
        print(_model);
        return _model;
      }

    }catch(e){
      log(e.toString());
    }
   

  }


  
}
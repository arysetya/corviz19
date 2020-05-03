import 'dart:convert';
import 'package:corviz/pages/infocoronadunia.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

//class Global {
////  final String name;
////  final int positif;
////  final int sembuh;
////  final int meninggal;
////
////  Global({this.name, this.positif, this.sembuh, this.meninggal});
////
////  factory Global.createGlobal(Map<String, dynamic> object) {
////    return Global(
////        name: object['name'],
////        positif: object['positif'],
////        sembuh: object['sembuh'],
////        meninggal: object['meninggal']);
////  }
////
////  static List<Global> getGlobal() async {
////    String apiUrl = "https://api.kawalcorona.com/";
////    var apiResult = await http.get(apiUrl);
////    var jsonObject = json.decode(apiResult.body);
////    List<dynamic> listGlobal =
////        (jsonObject as Map<String, dynamic>)['attributes'];
////
////    List<Global> idn = [];
////    for (int i = 0; i < listGlobal.length; i++)
////      idn.add(Global.createGlobal(listGlobal[i]));
////  }

//  static Future<Indonesia> fetchIndonesia() async {
//    final response = await http.get('https://api.kawalcorona.com/indonesia');
//    if (response.statusCode == 200) {
//      return Indonesia.fromJson(json.decode(response.body));
//    } else {
//      throw Exception('Failed to load Data');
//    }
//  }
//}

//  static Future<List<Indonesia>> fetchIndonesia() async{
//    String apiURL = "https://api.kawalcorona.com/indonesia" ;
//
//    //HASIL DARI API
//    var apiResult = await http.get(apiURL);
//    var jsonObject = json.decode(apiResult.body);
//    var dataIndonesia = (jsonObject as Map <String, dynamic>);
//
//    return Indonesia;
//  }

//}

Future<Gpositif> fetchPost() async {
  final response = await http.get('https://api.kawalcorona.com/positif');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Gpositif.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<http.Response> response(){
  return http.get('https://api.kawalcorona.com/positif');
}

class Gpositif {
  final int value;

  Gpositif({this.value});

  factory Gpositif.fromJson(Map<String, dynamic> json) {
    return Gpositif(
      value: json['value'],
    );
  }
}




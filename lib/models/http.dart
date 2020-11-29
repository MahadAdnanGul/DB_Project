import 'package:frontend/BO/BO.dart';
import 'package:frontend/models/inventory.dart';
import 'package:frontend/models/menu.dart';


import 'package:frontend/BO/BO.dart';
import 'package:frontend/models/menu.dart';
import 'package:frontend/models/inventory.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'user.dart';

class Http {
  // localhost || 10.0.2.2 (mysql) || 192.168.1.165 (home) || 10.192.82.178 (eduroam) || 10.10.10.47 (PIA despscho Juanjo)
  final url = 'http://192.168.0.100:4000/';
  // final users = 'dummy/';
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');

  Http ();

  Future<List<Customer>> getUsers() async {
    print("customer get works");
    final users='customers/';
    print('$url$users');
    http.Response response = await http.get('$url$users');
    print(response.body);
    // List<Customer> result = parseResponse_customer(response.body);
    List<Customer> result = new List<Customer>.from(json
        .decode(response.body)
        .map((jsonObject) => new Customer.fromJson(jsonObject)));
    print(result);
    result.sort((a, b) => a.id.compareTo(b.id));
    print('${getstatusCode(response.statusCode)}');
    return result;
  }

  makeUserDeleteRequest(Customer user) async {
    final users='customers/';
    http.Response response = await http.delete('$url$users${user.id}', headers: headers);
    print(response.body);
    print('Estado de respuesta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }
  Future<List<InventoryGet>> getInventory() async {
    print("byeee");
    final users='inventory/';
    print('$url$users');
    http.Response response = await http.get('$url$users');
    print(response.body);
    print("heloooooooooooo");
    var menuList = List<InventoryGet>();
    var menuJson= json.decode(response.body);
    for(var menu in menuJson){
      menuList.add(InventoryGet.fromJson(menu));
    }

    print(menuList);
    print("its donnee");
    return menuList;
    // List<MenuGet> result = new List<MenuGet>.from(json
    //           .decode(response.body)
    //           .map((jsonObject) => new MenuGet.fromJson(jsonObject)));

  }

  makeUserPutRequest(Customer user) async {
    final users='customers/';
    String body = json.encode(user.toJson());
    http.Response response = await http.put('$url$users${user.id}',
        headers: headers, body: body, encoding: encoding);
    print(response.body);
    print(
        'Estado de respuesta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  makeUserPostRequest(Customer user) async {
    print("going to post");
    final users='customers/';
    String body = json.encode(user.toJson());
    http.Response response =
    await http.post('$url$users', headers: headers, body: body, encoding: encoding);
    print(response.body);
    print(
        'Estado de respuesta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  MenuPostRequest(MenuPost menu) async {
    print("were at menu post");
    final users='menu/';
    String body = json.encode(menu.toJson());
    print(body);
    http.Response response =
    await http.post('$url$users', headers: headers, body: body, encoding: encoding);
    print("menu works");
    print(response.body);
  }

  Future<List<MenuGet>> getMenu() async {
    print("byeee");
    final users='menu/';
    print('$url$users');
    http.Response response = await http.get('$url$users');
    print(response.body);
    print("heloooooooooooo");
    var menuList = List<MenuGet>();
    var menuJson= json.decode(response.body);
    for(var menu in menuJson){
      menuList.add(MenuGet.fromJson(menu));
    }

    print(menuList);
    print("its donnee");
    return menuList;
    // List<MenuGet> result = new List<MenuGet>.from(json
    //           .decode(response.body)
    //           .map((jsonObject) => new MenuGet.fromJson(jsonObject)));

  }



  MenuDeleteRequest(MenuGet menu) async {
    print("reach");
    final users='menu/';
    http.Response response = await http.delete('$url$users${menu.item_id}', headers: headers);
    print("hogyaa");
    print(response.body);

  }

  menuPutRequest(MenuGet menu) async {
    final users='menu/';
    String body = json.encode(menu.toJson());
    http.Response response = await http.put('$url$users${menu.item_id}',
        headers: headers, body: body, encoding: encoding);
    print(response.body);

  }
  InventoryPutRequest(InventoryGet menu) async {
    final users='inventory/';
    String body = json.encode(menu.toJson());
    http.Response response = await http.put('$url$users${menu.num}',
        headers: headers, body: body, encoding: encoding);
    print(response.body);

  }

}

  
    

      

    
//     List<MenuGet> parseResponse(String body) {
//       final parsed = json.decode(body).cast<Map<String,dynamic>>();
//       return parsed;
// }


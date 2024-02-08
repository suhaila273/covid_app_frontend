import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidApiService {
  Future<dynamic> sendData(String name, String phone, String address, String symptom,String status) async
  {
    var client = http.Client();
    var apiUrl = Uri.parse("http://localhost:3001/api/patient/entry");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "phone": phone,
          "address": address,
          "symptom": symptom,
          "status": status,

        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to add");
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:work_with_api/province.dart';

class Api {
  Future<void> getAllProvincesOfVietNam(
      {Function(List<Province>) onSuccess, Function(String) onError}) async {
    String endpoint = 'https://vapi.vnappmob.com/api/province/';
    List<Province> provices = List();
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["results"];
        data.forEach((p) {
          provices.add(Province.formJson(p));
        });
        onSuccess(provices);
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
  }
}

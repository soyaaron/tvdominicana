import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tvdominicana/model/model.dart';
import 'package:flutter/services.dart';


// class JsonService {
//   final jsonText = rootBundle.loadString('assets/test.json');

//   final url = 'assets/test.json';

//   Future<List<Canal>> fetchCanalbyId(int canalid) async {
//     try {
//       var response = (jsonText;
//       Map<String, dynamic> data = json.decode(response.body);
//       List<Canal> canales = [];
//       data['results'].forEach(
//         (canalMap) => canales.add(Canal.fromJson(canalMap)),
//       );
//       return canales;
//     } catch (err) {
//       throw err.toString();
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oonzoo/model/universities_model.dart';

class UniversProvider extends ChangeNotifier {
  UniversProvider() {
    fetchcodes();
  }

  List<Universities_Model>? _universList;

  List<Universities_Model>? get universList => _universList;

  Future<void> fetchcodes() async {
    try {
      final uri = Uri.parse(
          'http://universities.hipolabs.com/search?country=United+states');

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        if (responseData.isNotEmpty) {
          List<Universities_Model> universitiesList = responseData
              .map((json) => Universities_Model.fromJson(json))
              .toList();

          _universList = universitiesList;
          notifyListeners();
        }
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }
}

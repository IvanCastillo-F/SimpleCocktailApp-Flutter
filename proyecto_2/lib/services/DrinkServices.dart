import 'dart:async';
import 'package:proyecto_2/data/Drinks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DrinksServices {
  
  Future<List<Drinks>> obtainDrinksbyId(var i) async {
    var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=' + i);
    var response  =  await http.get(url);
    var parsed = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(parsed);
    List<Drinks> bebidas =  jsonData["drinks"].map<Drinks>((json) => Drinks.fromJson(json)).toList();
    return bebidas;
  }
  

    Future<List<Drinks>> obtainbyCategory(var u) async {
    var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=' + u);
    var response  =  await http.get(url);
    var parsed = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(parsed);
    List<Drinks> bebidas =  jsonData["drinks"].map<Drinks>((json) => Drinks.fromJson(json)).toList();
    return bebidas;
  }

    Future<List<Drinks>> obtainCategories() async {
    var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');
    var response  =  await http.get(url);
    var parsed = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(parsed);
    List<Drinks> bebidas =  jsonData["drinks"].map<Drinks>((json) => Drinks.fromJson(json)).toList();
    return bebidas;
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/data/apis/api_response_codes.dart';
import 'dart:convert';

class APIBase {
  //Api Response codes initialization
  APIResponseCodes apiResponseCodes = APIResponseCodes();

  //Free ecommerce api
  final String productsApi = "https://api.escuelajs.co/api/v1/products";

  //products category
  final String productCategory = "https://api.escuelajs.co/api/v1/categories";

  //user lists
  final String userList = "https://api.escuelajs.co/api/v1/users";

  Future<List> fetchData(String apiLink) async {
    // Dio dio = Dio();
    // try {
    //   Response response = await dio.get('$apiLink');
    //   if (response.statusCode == apiResponseCodes.statusOK) {
    //     // Request successful, handle the data
    //     var data = response.data;

    //     return [true, response.statusCode, data];
    //     // Process the data as needed
    //   } else {
    //     // Handle error response
    //     print('Error: ${response.statusCode}');

    //     return [false, response.statusCode, null];
    //   }
    // } catch (error) {
    //   // Handle any exceptions that occur
    //   print('Error: $error');

    //   return [false, 0, null];
    // }

    //load json data from the data file
    String jsonString = await rootBundle.loadString('assets/product_list.json');
    // Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> dataList = json.decode(jsonString);

    return [true, 0, dataList];
  }
}

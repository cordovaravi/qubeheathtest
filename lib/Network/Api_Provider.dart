import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:qubehealthtest/Exception/Exception.dart';
import 'package:get/get.dart';

class ApiProvider {
  final String _baseUrl = 'https://www.qubehealth.com/';

  final Connectivity _connectivity = Connectivity();

  Future<bool> getConnectivityStatus() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //future Post
  Future<dynamic> post({required String url, requestJson}) async {
    var responseJson;
    try {
      final response = await http
          .post(Uri.parse(_baseUrl + url), body: requestJson, headers: {
        "x-api-key": "f6d646a6c2f2df883ea0cccaa4097358ede98284",
        'Content-Type': 'application/json',
      });

      responseJson = _response(response);
    } on SocketException {
      Get.snackbar(
          "No Internet", "Please make sure you have internt connection");
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        Get.snackbar("404", response.body.toString());
        break;
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

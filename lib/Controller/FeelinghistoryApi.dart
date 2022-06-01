import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qubehealthtest/Models/feelinghistorymodel.dart';
import 'package:qubehealthtest/Network/Api_Provider.dart';
import 'package:qubehealthtest/Utils/Api_paths.dart';

class FeelingApiController extends GetxController {
  //instance of base api provider
  ApiProvider _apiProvider = ApiProvider();

  //for loading
  var isLoading = true.obs;

  FeelingHistoryModel? feelingHistoryData;

  Future<FeelingHistoryModel?> fetchfeelingsHistory() async {
    isLoading(true);
    if (await _apiProvider.getConnectivityStatus()) {
      String requestJson =
          json.encode({"feeling_date": "15-04-2022", "user_id": "3206161992"});
      var response = await _apiProvider.post(
          url: getUserFeerlings, requestJson: requestJson);
      try {
        if (response["status"] == "200") {
          isLoading(false);
          log("loading value is ${isLoading.value}");
          feelingHistoryData = FeelingHistoryModel.fromJson(response);
          log("feeling data is :$feelingHistoryData");
        } else {
          isLoading(false);
          Get.snackbar("Something Went Wrong", "Please try leater");
        }
      } on Exception catch (e) {
        log(e.toString());
      }
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
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
      var response = await _apiProvider.post(url: getUserFeerlings);
      try {
        if (response["status"] == 200) {
          isLoading(false);
          feelingHistoryData = FeelingHistoryModel.fromJson(response);
        } else {
          isLoading(false);
          //load data locally done due to not received api key
          var decodedData = json
              .decode(await rootBundle.loadString('assets/sampleData.json'));
          feelingHistoryData = FeelingHistoryModel.fromJson(decodedData);
          log(feelingHistoryData!.data!.videoArr![0].toString());
        }
      } on Exception catch (e) {
        log(e.toString());
      }
    }
  }
}

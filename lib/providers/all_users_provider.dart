import 'package:flutter/material.dart';
import 'package:perfectiontest/services/get_all_users_service.dart';

import '../models/all_users_model_response_model.dart';

class AllUsersProvider extends ChangeNotifier {
  AllUsersProvider() {
    getNewData();
  }
  AllUsersModelResponse demo = getDemo();
  bool currentDemo = true;
  AllUsersModelResponse? currentData;
  Future<void> getNewData() async {
    currentData = await GetAllUsersService();
    currentDemo = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    print("print more");
    final newdata = await GetAllUsersService(lazyloading: true);
    newdata?.data?.forEach((item) {
      bool exists = false;
      currentData?.data?.forEach((olditem) {
        if (olditem.id == item.id) {
          exists = true;
        }
      });
      if (exists == false) {
        currentData?.data?.add(item);
      }
      // if (currentData?.data?.contains(item) == false) {
      //   currentData?.data?.add(item);
      // }
    });

    notifyListeners();
  }
}

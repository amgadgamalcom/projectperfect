import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:perfectiontest/constants/domain.dart';
import 'package:perfectiontest/models/all_users_model_response_model.dart';

Future<AllUsersModelResponse?> GetAllUsersService({
  bool lazyloading = false,
}) async {
  try {
    final dio = Dio();
    final response =
        await dio.get("${allUsersApi}?page=${lazyloading == false ? 1 : 2}}");
    final successResponse = response.data;
    return AllUsersModelResponse.fromJson(successResponse);
  } catch (e) {}
  return null;
}

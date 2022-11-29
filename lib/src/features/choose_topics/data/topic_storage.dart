import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/src/features/choose_topics/model/my_error.model.dart';
import 'package:meditation_app/src/features/choose_topics/model/topic.model.dart';

final dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        if (e.error is SocketException) {
          return handler.next(DioError(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: MyError(code: ErrorCode.serverError, originError: e.error),
          ));
        }
      },
    ),
  );

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {

  @override
  Future<List<Topic>> load() async {
    try {
      if (kDebugMode) {
        await Future.delayed(const Duration(seconds: 1));
      }
      final jsonContent =
          await rootBundle.loadString("mock/topics/topics.json");

      final List<dynamic> jsonData = jsonDecode(jsonContent);
      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }
}

// http://192.168.1.7:8080
// http://localhost:8080
class RemoteTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
    try {
      final response = await dio.get('http://localhost:8080/topics');
      final List<dynamic> jsonData = jsonDecode(response.data);
      return jsonData.map((e) => Topic.fromJson(e)).toList();
    } on DioError catch (e) {
      throw e.error;
    } on Exception catch (_) {
      throw MyError(code: ErrorCode.unknown);
    }
  }
}

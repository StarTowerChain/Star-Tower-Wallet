import 'package:dio/dio.dart';

import '../config/config.dart';

class JJHttpsClient {
  static String domain = Config.baseUri;
  static Dio dio = Dio();
  String access_token = "";

  JJHttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 15000;
    dio.options.receiveTimeout = 15000;
  }

  Future get(apiUrl, {Map<String, dynamic>? data}) async {
    print("get请求 ： ${replaeUri(apiUrl)}");
    print("get请求参数 ： $data");
    setupHeaderToken();
    print("token: $access_token");
    //
    try {
      var response;
      if (data != null) {
        response = await dio.get(replaeUri(apiUrl), queryParameters: data);
        print("get有参请求: ${response}");
      } else {
        response = await dio.get(replaeUri(apiUrl));
        print("get无参请求: ${response}");
      }
      return response;
    } catch (e) {
      print("请求失败: $e");
      return null;
    }
  }

  Future delete(apiUrl, {Map<String, dynamic>? data}) async {
    print("delete请求 ： ${replaeUri(apiUrl)}");
    setupHeaderToken();
    print("token: $access_token");

    try {
      var response;
      if (data != null) {
        print("delete有参请求");
        print("参数: $data");
        response = await dio.delete(replaeUri(apiUrl), queryParameters: data);
      } else {
        response = await dio.get(replaeUri(apiUrl));
        print("delete无参请求");
      }
      return response;
    } catch (e) {
      print("请求失败: $e");
      return null;
    }
  }

  Future post(String apiUrl, {Map? data}) async {
    print("post请求 ： ${replaeUri(apiUrl)}");
    print("参数 ： $data");

    setupHeaderToken();
    try {
      var response = await dio.post(replaeUri(apiUrl), data: data);
      return response;
    } catch (e) {
      print("请求失败");
      print(e);
      return null;
    }
  }

  //上传图片
  Future postChatMedia(path) async {
    return postImgAction('/upload/host_upload_img', path, 'image');
  }

  //上传图片
  Future postImgAction(
      String apiUrl, String imgFilePath, String paramsName) async {
    print("post上传图片请求 ： $apiUrl");
    print("参数 ： $apiUrl , $imgFilePath , $paramsName");
    setupHeaderToken();

    try {
      //参数
      Map<String, dynamic> map = Map();
      map[paramsName] = await MultipartFile.fromFile(imgFilePath);

      FormData formData = FormData.fromMap(map);
      Response result = await Dio().post(replaeUri(apiUrl), data: formData);

      return result;
    } catch (e) {
      print("上传失败");
      print(e);
      return null;
    }
  }

  Future put(String apiUrl, {Map? data}) async {
    print("put请求 ： $apiUrl");
    print("参数 ： $data");

    setupHeaderToken();
    try {
      var response = await dio.put(replaeUri(apiUrl), data: data);
      return response;
    } catch (e) {
      print("请求失败");
      print(e);
      return null;
    }
  }

  static replaeUri(picUrl) {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll("\\", "/");
  }

  void setupHeaderToken() {
    if (access_token.isNotEmpty) {
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在请求头中添加 token
          options.headers['Authorization'] = access_token;
          return handler.next(options);
        },
      ));
    }
  }
}

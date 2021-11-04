import 'package:dio/dio.dart';

/*
 * 封装 restful 请求
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */

class HttpUtils {
  static Dio? dio;

  // default options
  static const String API_PREFIX = 'https://dog.ceo/api';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;
  static const Map<String, dynamic> HEADER = {};

  // http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  // request method
  static Future<Map<String, dynamic>> request(String url, {data, method, headers}) async {
    var _headers = headers;

    data = data ?? {};
    method = method ?? 'GET';
    headers = headers ?? {};

    // restful 请求处理
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    // 打印请求相关信息：请求地址、请求方式、请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + data.toString());

    Dio? dio = createInstance();
    var result;

    try {
      Response response = await dio!.request(url,
          data: data, options: new Options(method: method, headers: _headers));
      result = response.data;

      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
    }

    return result;
  }

  // 创建 dio 实例对象
  static Dio? createInstance() {
    if (dio == null) {
      // 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions options = new BaseOptions(
          baseUrl: API_PREFIX,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);

      dio = new Dio(options);
    }

    return dio;
  }
}

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class HttpClient extends DioForNative {
  static final BaseOptions _options = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': '189a45dd7ce86676042909d64d011285',
      'language': 'pt-BR',
    },
  );

  HttpClient() : super(_options);
}

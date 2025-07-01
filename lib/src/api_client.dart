import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  static final Map<String, Dio> _dioClients = {};

  Dio get dio => _dioClients['consumer']!;

  void initialize({
    required String baseUrl,
    Map<String, String>? globalHeaders,
    List<Interceptor>? interceptors,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: globalHeaders,
    ));

    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    _dioClients['consumer'] = dio;
  }

  void initializeClient({
    required String name,
    required String baseUrl,
    Map<String, String>? globalHeaders,
    List<Interceptor>? interceptors,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: globalHeaders,
    ));

    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    _dioClients[name] = dio;
  }

  Dio getClient(String name) {
    if (!_dioClients.containsKey(name)) {
      throw Exception("Dio client '$name' not found. Did you initialize it?");
    }
    return _dioClients[name]!;
  }

  Dio createThirdPartyDio(String baseUrl, {Map<String, String>? headers}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ));
  }
}

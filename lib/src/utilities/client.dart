import 'package:http/http.dart' as http;
import 'package:xizmatbor/config.dart';

class Client extends http.BaseClient {
  final http.Client _inner;

  Client() : _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = Config.token;

    request.headers['Authorization'] = 'Bearer $token';

    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}

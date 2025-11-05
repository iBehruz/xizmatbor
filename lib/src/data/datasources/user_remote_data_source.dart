import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xizmatbor/src/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> fetchUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> fetchUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:xizmatbor/src/domain/entities/user.dart';
import 'package:xizmatbor/src/domain/repasitories/api_repository.dart';

abstract class GetUser {
  Future<Either<String, User>> call();
}

class GetUserImpl implements GetUser {
  final UserRepository repository;

  GetUserImpl({required this.repository});

  @override
  Future<Either<String, User>> call() {
    return repository.getUser();
  }
}

import 'package:dartz/dartz.dart';
import 'package:xizmatbor/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<String, User>> getUser();
}

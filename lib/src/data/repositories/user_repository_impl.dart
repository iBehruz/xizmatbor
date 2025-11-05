import 'package:dartz/dartz.dart';
import 'package:xizmatbor/src/data/datasources/user_remote_data_source.dart';
import 'package:xizmatbor/src/domain/entities/user.dart';
import 'package:xizmatbor/src/domain/repasitories/api_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, User>> getUser() async {
    try {
      final user = await remoteDataSource.fetchUser();
      return Right(user);
    } catch (e) {
      return Left('Error fetching user, $e');
    }
  }
}

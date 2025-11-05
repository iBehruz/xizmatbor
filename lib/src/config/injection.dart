import 'package:get_it/get_it.dart';
import 'package:xizmatbor/src/data/datasources/user_remote_data_source.dart';
import 'package:xizmatbor/src/data/repositories/user_repository_impl.dart';
import 'package:xizmatbor/src/domain/repasitories/api_repository.dart';
import 'package:xizmatbor/src/domain/usecases/get_user.dart';
import 'package:xizmatbor/src/presentation/bloc/user_bloc.dart';
import 'package:xizmatbor/src/utilities/client.dart' as http;

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Register the Remote Data Source with the required HTTP client
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl<http.Client>()),
  );

  // Register the Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // Register UseCases
  sl.registerLazySingleton<GetUser>(() => GetUserImpl(repository: sl()));

  // Register Bloc
  sl.registerFactory(() => UserBloc(getUser: sl<GetUser>()));
}

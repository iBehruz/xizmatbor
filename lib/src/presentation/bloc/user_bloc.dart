import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xizmatbor/src/domain/entities/user.dart';
import 'package:xizmatbor/src/domain/usecases/get_user.dart';

abstract class UserEvent {}

class GetUserEvent extends UserEvent {}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc({required this.getUser}) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());
      final result = await getUser();
      result.fold(
        (error) => emit(UserError(error)),
        (user) => emit(UserLoaded(user)),
      );
    });
  }
}

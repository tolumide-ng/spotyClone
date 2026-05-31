import 'package:dartz/dartz.dart';
import 'package:spotify/core/configs/usecase/usecase.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either<dynamic, dynamic>> call(params) async {
    return await sl<AuthRepository>().getUser();
  }
}

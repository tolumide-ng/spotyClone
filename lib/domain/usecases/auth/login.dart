import 'package:dartz/dartz.dart';
import 'package:spotify/core/configs/usecase/usecase.dart';
import 'package:spotify/data/models/auth/login_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class LoginUseCase implements UseCase<Either, LoginUserReq> {
  @override
  Future<Either<dynamic, dynamic>> call(LoginUserReq params) {
    return sl<AuthRepository>().login(params);
  }
}

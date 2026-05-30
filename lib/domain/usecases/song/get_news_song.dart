import 'package:dartz/dartz.dart';
import 'package:spotify/core/configs/usecase/usecase.dart';
import 'package:spotify/domain/repository/auth/song/song.dart';
import 'package:spotify/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either<dynamic, dynamic>> call(params) {
    return sl<SongRepository>().getNewsSongs();
  }
}

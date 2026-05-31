import 'package:dartz/dartz.dart';
import 'package:spotify/core/configs/usecase/usecase.dart';
import 'package:spotify/domain/repository/auth/song/song.dart';
import 'package:spotify/service_locator.dart';

class ToggleFavoriteSongsUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call(String? params) {
    return sl<SongRepository>().toggleFavoriteSongs(params!);
  }
}

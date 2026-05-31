import 'package:spotify/core/configs/usecase/usecase.dart';
import 'package:spotify/domain/repository/auth/song/song.dart';
import 'package:spotify/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call(String params) {
    return sl<SongRepository>().isFavoriteSong(params);
  }
}

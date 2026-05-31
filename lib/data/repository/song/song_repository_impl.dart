import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either<dynamic, dynamic>> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either<dynamic, dynamic>> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either<dynamic, dynamic>> toggleFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().toggleFavoriteSongs(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}

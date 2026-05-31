import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();

  Future<Either> toggleFavoriteSongs(String songId);

  Future<bool> isFavoriteSong(String songId);

  Future<Either> getUserFavoriteSongs();
}

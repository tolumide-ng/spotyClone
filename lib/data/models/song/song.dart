import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/auth/song/song.dart';

class SongModel {
  String? artist;
  String? title;
  double? duration;
  Timestamp? releaseDate;

  SongModel({
    required this.artist,
    required this.title,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      artist: artist!,
      title: title!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}

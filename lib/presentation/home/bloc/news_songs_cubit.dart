import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    print("the caller was called ******************");
    var returnedSongs = await sl<GetNewsSongsUseCase>().call({});

    print("received >>>> $returnedSongs");

    returnedSongs.fold(
      (l) => {emit(NewsSongsLoadFailure())},
      (data) => {emit(NewsSongsLoaded(songs: data))},
    );
  }
}

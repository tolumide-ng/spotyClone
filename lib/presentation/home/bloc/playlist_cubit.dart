import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_playlist.dart';
import 'package:spotify/presentation/home/bloc/playlist_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call({});

    returnedSongs.fold(
      (l) => {emit(PlayListLoadFailure())},
      (data) => {emit(PlayListLoaded(songs: data))},
    );
  }
}

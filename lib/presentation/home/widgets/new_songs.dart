import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/button/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/auth/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 240,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is NewsSongsLoaded) {
              return _songs(state.songs);
              // return Text("Welcome home ${state.songs.length}");
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: ((context, index) => SizedBox(width: 14)),
      itemCount: songs.length,

      itemBuilder: ((context, index) {
        return SizedBox(
          width: 160,
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${AppURLs.fireStorage}${songs[index].artist} - ${songs[index].title}.jpeg?${AppURLs.mediaAlt}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.darkGrey
                            : Color(0xffE6E6E6),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? Color(0xff959595)
                            : Color(0xff555555),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                songs[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                songs[index].artist,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ],
          ),
        );
      }),
    );
  }
}



//  [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                         '${AppURLs.fireStorage}${songs[index].artist} - ${songs[index].title}.jpeg?${AppURLs.mediaAlt}',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 songs[index].title,
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//               ),
//               Text(
//                 songs[index].artist,
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//               ),
//             ],
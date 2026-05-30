import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/auth/song/song.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text('Now Playing', style: TextStyle(fontSize: 16)),
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            _songCover(context),
            const SizedBox(height: 20),
            _songDetail(),
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppURLs.fireStorage}${songEntity.artist} - ${songEntity.title}.jpeg?${AppURLs.mediaAlt}',
          ),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 5),
            Text(
              songEntity.artist,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_outlined,
            size: 35,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}

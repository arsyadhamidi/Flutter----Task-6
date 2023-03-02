import 'package:flutter/material.dart';
import 'package:task6/model/modelvideo.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideo extends StatefulWidget {

  final ModelVideo? data;

  DetailVideo({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailVideo> createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.data?.linkVideo ?? '');

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false
      )
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Youtube",
        style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Ready'),
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent
                  ),
                ),
                const PlaybackSpeedButton(),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
          child: Text(widget?.data?.title ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(widget?.data?.pemilik ?? '', style: TextStyle(fontSize: 16),),
          ),
          // Text(widget?.data?.linkVideo ?? '')
        ],
      ),
    );
  }
}

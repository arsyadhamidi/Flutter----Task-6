import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:task6/model/modelaudio.dart';

class DetailAudio extends StatefulWidget {

  final ModelAudio? data;

  DetailAudio({Key? key, this.data}) : super(key: key);

  @override
  State<DetailAudio> createState() => _DetailAudioState();
}

class _DetailAudioState extends State<DetailAudio> {

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Youtube", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SizedBox(height: 20),
            Container(
              width: 300,
              child: Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1024px-YouTube_full-color_icon_%282017%29.svg.png"
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(widget?.data?.judul ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Spacer(),
            Center(
              child: Slider(
                min: 0,
                activeColor: Colors.red,
                inactiveColor: Colors.grey.withOpacity(0.2),
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async{},
              ),
            ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime!(position).toString()),
                Text(formatTime!(duration - position).toString()),
              ],
            ),
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.red,
            child: IconButton(
                onPressed: () async{
                  if(isPlaying){
                    await audioPlayer.pause();
                  }else{
                    // String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3";
                    String url = "${widget.data?.linkMusik ?? ''}";
                    await audioPlayer.play(
                        UrlSource(url)
                    );
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow
                ),
                color: Colors.white,
                iconSize: 50,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  String? formatTime(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inMinutes.remainder(60));

    return [
      if(duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}

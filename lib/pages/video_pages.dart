import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task6/model/modelvideo.dart';
import 'package:task6/network/network.dart';
import 'package:task6/pages/detail_video.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<ModelVideo>? listVideo;

  Future<List<ModelVideo>?> getShowVideo() async {
    try {
      List<ModelVideo>? response = await NetworkProvider().getDataVideo();
      setState(() {
        listVideo = response;
      });
    } catch (exp) {}

    return listVideo;
  }

  @override
  void initState() {
    getShowVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 30,
        ),
        child: ListView.builder(
          itemCount: listVideo?.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailVideo(
                            data: listVideo?[index],
                        )));
                  },
                  leading: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1024px-YouTube_full-color_icon_%282017%29.svg.png"),
                  title: Text(
                    listVideo?[index].title ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(listVideo?[index].pemilik ?? ''),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

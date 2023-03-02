import 'package:flutter/material.dart';
import 'package:task6/model/modelaudio.dart';
import 'package:task6/network/network.dart';
import 'package:task6/pages/detail_audio.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {

  List<ModelAudio>? listAudio;

  String urlAudio = "https://drive.google.com/file/d/1tPJBb89mHCpPQ9NnIgcN4WEr4cUk3Jak/view?usp=share_link";

  Future<List<ModelAudio>?> getListAudio() async{
    try{
      List<ModelAudio>? response = await NetworkProvider().getDataAudio();
      setState(() {
        listAudio = response;
      });
    }catch(exp){}

    return listAudio;

  }

  @override
  void initState() {
    getListAudio();
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
          top: 30
        ),
        child: ListView.builder(
          itemCount: listAudio?.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 7,
                child: ListTile(
                  leading: Icon(Icons.not_started, size: 40,),
                  title: Text(
                      listAudio?[index].judul ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailAudio(
                        data: listAudio?[index]
                    )));
                  },
                ),
              );
            },
        ),
      ),
    );
  }
}

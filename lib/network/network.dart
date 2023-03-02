import 'package:task6/constantfile/constantfile.dart';
import 'package:http/http.dart' as http;
import 'package:task6/model/modelaudio.dart';
import 'package:task6/model/modelvideo.dart';

class NetworkProvider{

  Future<List<ModelVideo>?> getDataVideo() async{
    final response = await http.get(Uri.parse(ConstantFile.url + "getvideo.php"));
    List<ModelVideo> datavideo = modelVideoFromJson(response.body);
    return datavideo;
  }

  Future<List<ModelAudio>?> getDataAudio() async{
    final response = await http.get(Uri.parse(ConstantFile.url + "getaudio.php"));
    List<ModelAudio> dataaudio = modelAudioFromJson(response.body);
    return dataaudio;
  }

}
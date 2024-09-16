
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');
    

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
   
    return  yesNoModel.toMessageEntity();

    /*
      este es el mapa trabajado
      map<String, dynamic> dara = {
        'answer': 'yes',
        'forced: true,
        'image': 'http://asd/assdfag'

      }
      el modelo YesNoModel me ayudara a trabajar con una implementación de la respuesta
      de la api
     */
    
  }
}
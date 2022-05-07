import 'package:myapp/services/base_service.dart';

import '../models/reponses/monument_response.dart';

class QuizService extends BaseService {
  QuizService() : super('quiz');
  
  Future<MonumentResponsePost> getMonumentsPost(int i) async {
      late MonumentResponsePost _response;
      String _path = serviceBuilder.addParam("question").build();
      print(_path);
      try {
        var _dioResponse = await dio.post(
          _path,
          data: {"monumentUid": i},
          options: options,
        );
        print(_dioResponse.data.runtimeType);
        _response = MonumentResponsePost.fromJson(_dioResponse.data);
      } catch (e) {
        //TODO:error handling
        _response = MonumentResponsePost(monuments: []);
        throw Exception(e);
      }
      print(_response.toString());
      return _response;
    }
}



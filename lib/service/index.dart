import 'package:myapp/config/http.dart';
import 'package:myapp/model/indexModel.dart';
class IndexRequest {
  static getBaseInfo () async{
     final response = await HttpRequest.request('https://cdn.lishaoy.net/ctrip/homeConfig.json');
     return IndexModel.fromJson(response);
  }
}
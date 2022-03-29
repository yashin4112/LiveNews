import 'package:http/http.dart' as http;

class Request {
  static Future<String?> makeRequest({RequestType type = RequestType.GET, required Uri uri}) async{
    http.Response  response;
    switch (type) {
      case RequestType.GET:
        response = await http.get(uri);
        break;
      case RequestType.POST:
        response = await http.post(uri);
        break; 
      default:
      response  = await http.get(uri);
      break;
    }

    if (response.statusCode == 200) {
      return response.body;
    }
  }

}

enum RequestType{
  GET,
  POST
}
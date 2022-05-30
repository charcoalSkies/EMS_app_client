import 'package:dio/dio.dart';

//const _API = "https://jsonplaceholder.typicode.com/posts";
const _API = "http://10.0.2.2:8000/login";
// const _API = "http://121.190.132.209:8080/login";

class Server {
  Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API/200");
    print(response.data.toString());
  }

  Future<void> postReq(id, pw) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(_API, data: {"id": id, "pw": pw});
    print(response.data.toString());
  }
}

Server server = Server();

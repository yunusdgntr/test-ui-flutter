import 'package:dio/dio.dart';

class RegisterService {
  Future<String> registerUser(
      String username, String email, String password) async {
    var response = "";
    var dio = Dio();
    Response result =
        await dio.get('https://128.199.37.194:5001/BookCommnet/tolstoy');

    return response;
  }
}

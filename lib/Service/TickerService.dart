import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testui/Models/ticker.dart';

class TickerService {
  Future<List<Ticker>> GetTickerList() async {
    String _url = 'http://128.199.37.194/ticker.php';

    List<Ticker> result = [
      Ticker(tickerName: 'TEST', price: 123213, change: 21321),
      Ticker(tickerName: 'TEST2', price: 435, change: 21321),
      Ticker(tickerName: 'TEST3', price: 123, change: 213),
      Ticker(tickerName: 'TEST4', price: 5423, change: 234),
      Ticker(tickerName: 'TEST', price: 123213, change: 21321),
      Ticker(tickerName: 'TEST2', price: 435, change: 21321),
      Ticker(tickerName: 'TEST3', price: 123, change: 213),
      Ticker(tickerName: 'TEST4', price: 5423, change: 234),
      Ticker(tickerName: 'TEST', price: 123213, change: 21321),
      Ticker(tickerName: 'TEST2', price: 435, change: 21321),
      Ticker(tickerName: 'TEST3', price: 123, change: 213),
      Ticker(tickerName: 'TEST4', price: 5423, change: 234),
    ];

    // try {
    //   Map<String, dynamic> jsonResult = Map<String, dynamic>();
    //   Dio _dio = Dio();
    //   Response response = await _dio.get(_url);

    //   if (response.statusCode == 200) {
    //     var jobList = response.data;
    //     // result =
    //     //     List<Ticker>.from(jobList.map((model) => Ticker.fromJson(model)))
    //     //         .toList();
    //   } else {}
    // } catch (e) {
    //   print(e);
    // }

    return result;
  }
}

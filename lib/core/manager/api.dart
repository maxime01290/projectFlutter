import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_project/core/model/launch.dart';

import 'api_interceptor.dart';

class Api {
  Dio dio;
  CancelToken cancelToken;

  Api(){
    dio = Dio();
    dio.interceptors.add(ApiInterceptor());
    dio.options.baseUrl= "https://api.spacexdata.com/v4/launches";
  }

  Future<List<dynamic>> fetchData() async{
    cancelToken = CancelToken();
    var jsonMap = await this.getData(cancelToken);
    return jsonMap;
  }
  Future<List<dynamic>> getData(CancelToken cancelToken) async{
    try{
      var response = await dio.get<List<dynamic>>("/upcoming");
      print(response.data);
      return response.data;
    } catch(e){
      if(e is DioError && e.type == DioErrorType.CANCEL){
        print("Request cancelled");
      }else{
        print("Erreur : $e");
      }
      return null;
    }
  }

  Future<List<Launch>> loadContent(BuildContext context) async {
    var json = await fetchData();
    List<Launch> launchs = List();
    for(dynamic item in json){
      launchs.add(Launch.fromJson(item));
    }
    return launchs;
  }

  Future<Launch> fetchDetail(String url) async{
    cancelToken = CancelToken();
    var jsonMap = await this.getDetailData(cancelToken,url);
    return jsonMap;
  }

  Future<Launch> getDetailData(CancelToken cancelToken,String url) async {
    try{
      var response = await dio.get(url);
      print(response.data);
      return Launch.fromJson(response.data);
    } catch(e){
      if(e is DioError && e.type == DioErrorType.CANCEL){
        print("Request cancelled");
      }else{
        print("Erreur : $e");
      }
      return null;
    }
  }


}
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_project/core/model/companyInfo.dart';
import 'package:flutter_app_project/core/model/launch.dart';
import 'package:flutter_app_project/core/model/map_api.dart';

import 'api_interceptor.dart';


class Api {
  List<Launch> launchList;
  Dio dio;
  CancelToken cancelToken;

  static final Api _instance = Api._internal();

  factory Api() => _instance;

  Api._internal(){
    dio = Dio();
    dio.interceptors.add(ApiInterceptor());
    dio.options.baseUrl= "https://api.spacexdata.com/v4";
  }

  List<Launch> getLaunchByName(String name) {
    List<Launch> matchingLaunch = List();
    if (launchList != null && launchList.isNotEmpty) {
      for (Launch launch in launchList) {
        if (launch.name.toLowerCase().contains(name.toLowerCase())) {
            matchingLaunch.add(launch);
        }
      }
    }
    return matchingLaunch;
  }

  //LAUNCHLIST
  Future<List<Launch>> loadContent(BuildContext context) async {
    launchList = List();
    var json = await fetchData();
    for(dynamic item in json){
      launchList.add(Launch.fromJson(item));
    }
    return launchList;
  }

  Future<List<dynamic>> fetchData() async{
    cancelToken = CancelToken();
    var jsonMap = await this.getData(cancelToken);
    return jsonMap;
  }

  Future<List<dynamic>> getData(CancelToken cancelToken) async{
    try{
      var response = await dio.get<List<dynamic>>("/launches/upcoming");
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

  //HISTORY
  Future<List<dynamic>> fetchDataHistory() async{
    cancelToken = CancelToken();
    var jsonMap = await this.getDataHistory(cancelToken);
    return jsonMap;
  }

  Future<List<dynamic>> getDataHistory(CancelToken cancelToken) async{
    try{
      var response = await dio.get<List<dynamic>>("/launches/past");
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

  Future<List<Launch>> loadContentHistory(BuildContext context) async {
    var json = await fetchDataHistory();
    List<Launch> launchs = List();
    for(dynamic item in json){
      launchs.add(Launch.fromJson(item));
    }
    return launchs;
  }


  //COMPANY
  Future<dynamic> fetchDataCompany() async{
    cancelToken = CancelToken();
    var jsonMap = await this.getDataCompany(cancelToken);
    return jsonMap;
  }

  Future<dynamic> getDataCompany(CancelToken cancelToken) async{
    try{
      var response = await dio.get<dynamic>("/company");
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

  Future<CompanyInfo> loadContentCompany(BuildContext context) async {
    var json = await fetchDataCompany();
    CompanyInfo companyInfo = CompanyInfo.fromJson(json);
    return companyInfo;
  }


  //MAP
  Future<List<MapApi>> loadContentMap(BuildContext context) async {
    var json = await fetchDataMap();
    List<MapApi> mapList = List();
    for(dynamic item in json){
      mapList.add(MapApi.fromJson(item));
    }
    return mapList.toList();
  }

  Future<dynamic> fetchDataMap() async{
    cancelToken = CancelToken();
    var jsonMap = await this.getDataMap(cancelToken);
    return jsonMap;
  }

  Future<dynamic> getDataMap(CancelToken cancelToken) async{
    try{
      var response = await dio.get<dynamic>("/launchpads");
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
}
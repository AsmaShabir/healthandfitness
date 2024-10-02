



import '../data/network/baseapi_service.dart';
import '../data/network/networkapi_service.dart';
import '../resources/components/app_urls.dart';

class AuthRepository{

  BaseApiService apiService =NetworkApiService();

  Future<dynamic>loginApi(dynamic data) async{
    try{
      dynamic response =await apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
  Future<dynamic>SignUpApi(dynamic data) async{
    try{
      dynamic response =await apiService.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}
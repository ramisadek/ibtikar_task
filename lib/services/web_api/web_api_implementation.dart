import 'package:dio/dio.dart';
import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';
import 'package:ibtikar_task/services/web_api/web_api.dart';

class WebApiImpl extends WebApi{
  static final _host = 'https://run.mocky.io/v3/';
  static final _shoppingList = '709a03e5-8382-47bb-961b-d9f14421132e';

  @override
  Future<List<ShoppingList>?> getShoppingList() async{
    Response _response;
    ShoppingListModel _shoppingListModel = ShoppingListModel();
    try{
      _response = await Dio().get(
          "$_host$_shoppingList",
          options: Options(
            receiveTimeout: 10000,
          )
      );
      _shoppingListModel = ShoppingListModel.fromMap(_response.data);
    }
    on DioError catch(e){
      print("error in WebApiImpl => ${e.response?.data}");
    }
    return _shoppingListModel.shoppingList;
  }
}
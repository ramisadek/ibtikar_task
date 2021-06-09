import 'package:connectivity/connectivity.dart';
import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';
import 'package:ibtikar_task/services/shopping_list/shopping_list_service.dart';
import 'package:ibtikar_task/services/storage/storage_service.dart';
import 'package:ibtikar_task/services/web_api/web_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

class ShoppingListServiceImplementation extends ShoppingListService{

  WebApi _webApi = serviceLocator<WebApi>();
  StorageService _storageService = serviceLocator<StorageService>();

  @override
  addToShoppingList(ShoppingList shoppingList) => _storageService.addToList(shoppingList);

  @override
  deleteFromShoppingList(int index) => _storageService.deleteFromList(index);

  @override
  Future<List<ShoppingList>> getShoppingList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none){
      return _storageService.getShoppingList();
    }
    else{
      List<ShoppingList>? shoppingList;
      shoppingList = await _webApi.getShoppingList();
      if(shoppingList == null)
        return _storageService.getShoppingList();
      else{
        if(prefs.getBool("firstTime") == null){
          shoppingList.forEach((element) {
            _storageService.addToList(element);
          });
          prefs.setBool("firstTime", false);
        }

        return shoppingList;
      }

    }
  }
}
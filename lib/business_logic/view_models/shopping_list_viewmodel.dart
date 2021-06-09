import 'package:flutter/cupertino.dart';
import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';
import 'package:ibtikar_task/services/service_locator.dart';
import 'package:ibtikar_task/services/shopping_list/shopping_list_service.dart';

class ShoppingListViewModel extends ChangeNotifier{
 final ShoppingListService _shoppingListService = serviceLocator<ShoppingListService>();
 late List<ShoppingList> _shoppingList;

 loadDate() async{
  _shoppingList = await _shoppingListService.getShoppingList();
 }

 addToList(String text){
  ShoppingList shoppingList = ShoppingList(
   content: text,
   check: false,
  );
  _shoppingList.add(shoppingList);
  _shoppingListService.addToShoppingList(shoppingList);
  notifyListeners();
 }

 deleteFromList(int index){
  _shoppingList.removeAt(index);
  _shoppingListService.deleteFromShoppingList(index);
  notifyListeners();
 }

 List<ShoppingList> get getShoppingList => _shoppingList;

}
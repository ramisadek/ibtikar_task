import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';

abstract class StorageService{
  initHive();
  addToList(ShoppingList shoppingList);
  Future<List<ShoppingList>> getShoppingList();
  deleteFromList(int index);
}
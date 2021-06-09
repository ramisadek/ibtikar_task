import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';

abstract class ShoppingListService {
  Future<List<ShoppingList>> getShoppingList();
  addToShoppingList(ShoppingList shoppingList);
  deleteFromShoppingList(int index);

}
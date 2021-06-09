import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';

abstract class WebApi{
  Future<List<ShoppingList>?> getShoppingList();
}
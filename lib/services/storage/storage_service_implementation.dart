import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';
import 'package:ibtikar_task/services/storage/storage_service.dart';

class StorageServiceImpl extends StorageService{

  static final _shoppingListKey = "shoppingList";

  @override
  initHive() async{
    await Hive.initFlutter();
    Hive.registerAdapter(ShoppingListAdapter());
  }

  @override
  addToList(ShoppingList shoppingList) async{
    var box = await Hive.openBox<ShoppingList>('$_shoppingListKey');
    box.add(shoppingList);
    box.compact();
  }

  @override
  deleteFromList(int index) async{
    var box = await Hive.openBox<ShoppingList>('$_shoppingListKey');
    box.deleteAt(index);
    box.compact();
  }

  @override
  Future<List<ShoppingList>> getShoppingList() async{
    var box = await Hive.openBox<ShoppingList>('$_shoppingListKey');
    return box.values.toList();
  }
  
}
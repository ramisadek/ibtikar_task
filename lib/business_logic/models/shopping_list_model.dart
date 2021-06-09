import 'package:hive/hive.dart';

part 'shopping_list_model.g.dart';

class ShoppingListModel {
  ShoppingListModel({
     this.shoppingList,
  });

  List<ShoppingList>? shoppingList;

  factory ShoppingListModel.fromMap(Map<String, dynamic> json) => ShoppingListModel(
    shoppingList: json["shopping_list"] == null ? [] : List<ShoppingList>.from(json["shopping_list"].map((x) => ShoppingList.fromMap(x))),
  );

}

@HiveType(typeId : 1)
class ShoppingList {
  ShoppingList({
    required this.check,
    required this.content,
  });

  @HiveField(0)
  bool check;
  @HiveField(1)
  String content;

  factory ShoppingList.fromMap(Map<String, dynamic> json) => ShoppingList(
    check: json["check"]?? false ,
    content: json["content"] ?? "",
  );
}

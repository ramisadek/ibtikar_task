import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibtikar_task/business_logic/view_models/shopping_list_viewmodel.dart';
import 'package:ibtikar_task/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'add_to_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingListViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Icon(
            Icons.flutter_dash_rounded,
            size: 100,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add_box,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToListScreen()));
              },
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: model.getShoppingList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                child: Container(
                  color: index % 2 == 0 ? Colors.white : Colors.cyan[50]?.withOpacity(0.5),
                  child: ListTile(
                    title: Text(
                      "${model.getShoppingList[index].content}",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (DismissDirection direction) {
                  model.deleteFromList(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

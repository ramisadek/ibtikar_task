import 'package:flutter/material.dart';
import 'package:ibtikar_task/business_logic/models/shopping_list_model.dart';
import 'package:ibtikar_task/business_logic/view_models/shopping_list_viewmodel.dart';
import 'package:ibtikar_task/services/service_locator.dart';
import 'package:provider/provider.dart';

class AddToListScreen extends StatelessWidget {

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var model = context.watch<ShoppingListViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () => _focusNode.unfocus(),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10),),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (Colors.cyan)),
                    ),
                    fillColor: Colors.grey[300],
                    filled: true,
                    labelText: "Input here",
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),),
            InkWell(
              onTap: () {
                model.addToList(_textEditingController.text);
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.cyan,
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Add to shopping list",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

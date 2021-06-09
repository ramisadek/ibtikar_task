import 'package:flutter/material.dart';
import 'package:ibtikar_task/services/service_locator.dart';
import 'package:ibtikar_task/services/storage/storage_service.dart';
import 'package:ibtikar_task/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'business_logic/view_models/shopping_list_viewmodel.dart';


void main() {
  setupServiceLocator();
  StorageService _storageService = serviceLocator<StorageService>();
  _storageService.initHive();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShoppingListViewModel model = serviceLocator<ShoppingListViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.loadDate();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: MaterialApp(
        title: 'ibtikar task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}



import 'package:get_it/get_it.dart';
import 'package:ibtikar_task/business_logic/view_models/shopping_list_viewmodel.dart';
import 'package:ibtikar_task/services/shopping_list/shopping_list_service.dart';
import 'package:ibtikar_task/services/shopping_list/shopping_list_service_implementation.dart';
import 'package:ibtikar_task/services/storage/storage_service.dart';
import 'package:ibtikar_task/services/storage/storage_service_implementation.dart';
import 'package:ibtikar_task/services/web_api/web_api.dart';
import 'package:ibtikar_task/services/web_api/web_api_implementation.dart';

GetIt serviceLocator = GetIt.instance;

setupServiceLocator() {

  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator.registerLazySingleton<ShoppingListService>(() => ShoppingListServiceImplementation());

  serviceLocator.registerFactory<ShoppingListViewModel>(() => ShoppingListViewModel());

}
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ProviderOne extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  InAppWebViewController? inAppWebViewController;

  init({required InAppWebViewController controller}) {
    inAppWebViewController = controller;
    notifyListeners();
  }

  void getSearchData({required String title}) {
    APIService.apiService.getData(title: title);
    notifyListeners();
  }
}

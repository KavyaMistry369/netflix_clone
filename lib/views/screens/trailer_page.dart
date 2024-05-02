import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:netflix_clone/controllers/provider_one.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:provider/provider.dart';

class TrailerPage extends StatelessWidget {
  const TrailerPage({super.key});

  @override
  Widget build(BuildContext context) {

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri(
                APIService.apiService.allSearchData[index].trailer)),
        onWebViewCreated: (controller) {
          Provider.of<ProviderOne>(context, listen: false)
              .init(controller: controller);
        },
      ),
    );
  }
}

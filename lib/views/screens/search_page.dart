import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/provider_one.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:provider/provider.dart';

import '../../utils/route_utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderOne>(builder: (context, p, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: CupertinoTextField(
            autocorrect: true,
            cursorOpacityAnimates: true,
            cursorColor: Colors.white,
            controller: p.searchController,
            placeholder: "Search",
            suffix: IconButton(
                onPressed: () {
                  p.getSearchData(title: p.searchController.text);
                  p.searchController.clear();
                },
                icon: const Icon(Icons.search)),
            style: const TextStyle(color: Colors.white),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.red, width: 1),
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future:
                APIService.apiService.getData(title: p.searchController.text),
            builder: (context, snapshot) {
              return GridView.builder(
                itemCount: APIService.apiService.allSearchData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2 / 3),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,MyRoutes.searchDetails,arguments: index);
                  },
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(APIService.apiService.allSearchData[index].poster_path)),
                  ),
                ),);
            },
          ),
        ),
      );
    });
  }
}

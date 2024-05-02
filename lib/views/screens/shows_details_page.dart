import 'package:flutter/material.dart';

import '../../services/data_service.dart';

class ShowsDetailsPage extends StatelessWidget {
  const ShowsDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
            stream: DataService.dataService.getShows(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              "${snapshot.data!.docs[index]["bgImage"]}")),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${snapshot.data!.docs[index]["title"]}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 500,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black87,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Play",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 500,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Download",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${snapshot.data!.docs[index]["des"]}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                );
              }
              return const Text("");
            }),
      ),
    );
  }
}

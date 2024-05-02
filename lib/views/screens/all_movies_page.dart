import 'package:flutter/material.dart';
import 'package:netflix_clone/services/data_service.dart';
import 'package:netflix_clone/utils/route_utils.dart';

class AllMoviesPage extends StatelessWidget {
  const AllMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("All Movies"),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: DataService.dataService.getMovies(),
          builder: (context,snapshot) {
           if(snapshot.hasData){
             return GridView.builder(
              itemCount: snapshot.data!.docs.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 20,
                   mainAxisSpacing: 20,
                   childAspectRatio: 2 / 3),
               itemBuilder: (context, index) => GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context,MyRoutes.movieDetailsPage,arguments: index);
                 },
                 child: SizedBox(
                   height: 300,
                   width: 200,
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(15),
                       child: Image.network("${snapshot.data!.docs[index]["image"]}")),
                 ),
               ),);
           }
           return const Text("");
          }
        ),
      ),
    );
  }
}

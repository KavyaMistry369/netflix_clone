import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/services/data_service.dart';
import 'package:netflix_clone/utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context,MyRoutes.searchPage);
          }, icon: const Icon(Icons.search,color: Colors.white,))
        ],
        title: Image.asset("assets/images/logo.png",width: 150,),
        leading: const Icon(Icons.drag_handle),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/P1.jpg",
                        width: 500,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/P2.jpg",
                        width: 500,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/P3.jpg",
                        width: 500,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/P4.jpg",
                        width: 500,
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2 / 3,
                  )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                     Navigator.pushNamed(context,MyRoutes.allTrendingPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getTrending(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context,MyRoutes.trendingDetailsPage,arguments: index);
                                },
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "${snapshot.data!.docs[index]["image"]}"),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Movies",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.allMoviesPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getMovies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context,MyRoutes.movieDetailsPage,arguments: index);
                                    },
                                    child: SizedBox(
                                      height: 300,
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            "${snapshot.data!.docs[index]["image"]}"),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Shows",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.allShowsPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getShows(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context,MyRoutes.showDetailsPage,arguments: index);
                                    },
                                    child: SizedBox(
                                      height: 300,
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            "${snapshot.data!.docs[index]["image"]}"),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.allNewPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getNewMovies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context,MyRoutes.newDetailsPage,arguments: index);
                                },
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "${snapshot.data!.docs[index]["image"]}"),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),




              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Family",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.allFamilyPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getFamily(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context,MyRoutes.familyDetailsPage,arguments: index);
                                },
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "${snapshot.data!.docs[index]["image"]}"),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),




              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Animation",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.allAnimationPage);
                  }, child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View all",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 30,)
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: DataService.dataService.getAnimationMovies(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                                (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context,MyRoutes.animationDetailsPage,arguments: index);
                                },
                                child: SizedBox(
                                  height: 300,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "${snapshot.data!.docs[index]["image"]}"),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    );
                  }
                  return const Text("");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

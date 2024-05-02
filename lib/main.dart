import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/controllers/provider_one.dart';
import 'package:netflix_clone/utils/route_utils.dart';
import 'package:netflix_clone/views/screens/all_animation_page.dart';
import 'package:netflix_clone/views/screens/all_family_page.dart';
import 'package:netflix_clone/views/screens/all_movies_page.dart';
import 'package:netflix_clone/views/screens/all_new_page.dart';
import 'package:netflix_clone/views/screens/all_shows_page.dart';
import 'package:netflix_clone/views/screens/all_trending_page.dart';
import 'package:netflix_clone/views/screens/animation_details.dart';
import 'package:netflix_clone/views/screens/family_details.dart';
import 'package:netflix_clone/views/screens/home_page.dart';
import 'package:netflix_clone/views/screens/intro_page.dart';
import 'package:netflix_clone/views/screens/login_page.dart';
import 'package:netflix_clone/views/screens/movies_details_page.dart';
import 'package:netflix_clone/views/screens/new_details.dart';
import 'package:netflix_clone/views/screens/register_page.dart';
import 'package:netflix_clone/views/screens/search_details_page.dart';
import 'package:netflix_clone/views/screens/search_page.dart';
import 'package:netflix_clone/views/screens/shows_details_page.dart';
import 'package:netflix_clone/views/screens/splash_page.dart';
import 'package:netflix_clone/views/screens/trailer_page.dart';
import 'package:netflix_clone/views/screens/trending_details.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProviderOne(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: CupertinoColors.destructiveRed,
      ),
      initialRoute: MyRoutes.splashPage,
      routes: {
        MyRoutes.splashPage: (context) => const SplashPage(),
        MyRoutes.introPage: (context) => const IntroPage(),
        MyRoutes.loginPage: (context) => const LoginPage(),
        MyRoutes.registerPage: (context) => const RegisterPage(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.movieDetailsPage: (context) => const MoviesDetailsPage(),
        MyRoutes.showDetailsPage: (context) => const ShowsDetailsPage(),
        MyRoutes.trendingDetailsPage: (context) => const TrendingDetails(),
        MyRoutes.newDetailsPage: (context) => const NewDetails(),
        MyRoutes.familyDetailsPage: (context) => const FamilyDetails(),
        MyRoutes.animationDetailsPage: (context) => const AnimationDetails(),
        MyRoutes.allMoviesPage: (context) => const AllMoviesPage(),
        MyRoutes.allShowsPage: (context) => const AllShowsPage(),
        MyRoutes.allTrendingPage: (context) => const AllTredningPage(),
        MyRoutes.allAnimationPage: (context) => const AllAnimationPage(),
        MyRoutes.allFamilyPage: (context) => const AllFamilyPage(),
        MyRoutes.allNewPage: (context) => const AllNewPage(),
        MyRoutes.searchPage: (context) => const SearchPage(),
        MyRoutes.searchDetails:(context) => const SearchDetailsPage(),
        MyRoutes.trailerPage:(context) => const TrailerPage(),
      },
    );
  }
}

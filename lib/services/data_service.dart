import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {

  DataService._();

  static final DataService dataService = DataService._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Stream<QuerySnapshot<Map<String, dynamic>>> getMovies() {
    return firestore.collection('movies').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getShows() {
    return firestore.collection('shows').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTrending() {
    return firestore.collection('home').doc("Trending").collection("trendingMovies").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNewMovies() {
    return firestore.collection('home').doc("New").collection("newMovies").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFamily() {
    return firestore.collection('home').doc("Family").collection("familyMovies").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAnimationMovies() {
    return firestore.collection('home').doc("Animation").collection("animationMovies").snapshots();
  }

}
class SearchModel {

  final String backdrop_path;
  final String overview;
  final String poster_path;
  final String title;
  final String trailer;

  SearchModel({required this.title,
    required this.backdrop_path,
    required this.trailer,
    required this.overview,
    required this.poster_path,});

  factory SearchModel.fromMap({required Map data}){
    return SearchModel(title: data["title"],
        trailer: data["youtube_trailer"],
        backdrop_path: data["backdrop_path"],
        overview: data["overview"],
        poster_path: data["poster_path"]);
  }

}
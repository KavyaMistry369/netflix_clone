class ShowsModel {
  final String backdrop_path;
  final List genres;
  final String original_title;
  final String overview;
  final String poster_path;
  final String first_aired;
  final String title;
  final String contentType;

  ShowsModel({required this.title,
    required this.backdrop_path,
    required this.contentType,
    required this.genres,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.first_aired});

  factory ShowsModel.fromMap({required Map data}){
    return ShowsModel(title: data["title"],
        backdrop_path: data["backdrop_path"],
        contentType: data["contentType"],
        genres: data["genres"],
        original_title: data["original_title"],
        overview: data["overview"],
        poster_path: data["poster_path"],
        first_aired: data["first_aired"]);
  }

}

const String tblMovie = 'tbl_movie';
const String tblMovieColId = 'id';
const String tblMovieColName = 'name';
const String tblMovieColSubtitle = 'subtitle';
const String tblMovieColType = 'type';
const String tblMovieColDescription = 'description';
const String tblMovieColRating = 'rating';
const String tblMovieColImage = 'image';
const String tblMovieColReleaseDate = 'date';
class Movie{
  int? id;
  String? name;
  String? subTitle;
  String? type;
  String? description;
  double? rating;
  String? image;
  int? releaseDate;

  Movie(
      {this.id,
        this.name,
        this.subTitle,
        this.type,
        this.description,
        this.rating,
        this.image,
        this.releaseDate});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      tblMovieColName : name,
      tblMovieColDescription : description,
      tblMovieColImage: image,
      tblMovieColRating: rating,
      tblMovieColReleaseDate : releaseDate,
      tblMovieColSubtitle : subTitle,
      tblMovieColType : type
    };
    if(id != null) {
      map[tblMovieColId] = id;
    }
    return map;
  }

  factory Movie.fromMap(Map<String, dynamic> map) => Movie(
    id: map[tblMovieColId],
    name: map[tblMovieColName],
    type: map[tblMovieColType],
    description: map[tblMovieColDescription],
    subTitle: map[tblMovieColSubtitle],
    image: map[tblMovieColImage],
    rating: map[tblMovieColRating],
    releaseDate: map[tblMovieColReleaseDate],
  );
}
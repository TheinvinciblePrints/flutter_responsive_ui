class AlbumResponse {
  List<Album> albums;

  AlbumResponse({this.albums});

  AlbumResponse.fromJson(List<dynamic> json) {
    albums = json.map((album) => Album.fromJson(album)).toList();
  }

// factory PhotoResponse.fromJson(List<dynamic> json) {
//   return PhotoResponse(
//       result: json.map((e) => PhotoItem.fromJson(e)).toList());
// }

}

class Album {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  // Return object from JSON //
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }
}

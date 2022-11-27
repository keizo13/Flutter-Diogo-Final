import '../../core/interface/http_interface.dart';

class HomeRepository {
  final HttpInterface http;

  HomeRepository({required this.http});

  Future<Map<String, dynamic>> getPopularMovies() async {
    try {
      var response = await http.get(
        'https://api.themoviedb.org/3/tv/popular',
        queryParameters: {
          'api_key': 'fec699f7fbbce2834ceb4e65bd90440f',
          'language': 'en-US',
          'page': 1,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getTopRatedMovies() async {
    try {
      var response = await http.get(
        'https://api.themoviedb.org/3/movie/top_rated',
        queryParameters: {
          'api_key': 'fec699f7fbbce2834ceb4e65bd90440f',
          'language': 'en-US',
          'page': 1,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

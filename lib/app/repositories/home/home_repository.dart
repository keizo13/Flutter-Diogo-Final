import '../../core/interface/http_interface.dart';

class HomeRepository {
  final HttpInterface http;

  HomeRepository({required this.http});
//repositorios onde estao as chamadas da api, onde chama a api pro aplicativo
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

  Future<Map<String, dynamic>> getLatestMovies() async {
    try {
      var response = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing',
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

  Future<Map<String, dynamic>> getDetailsMovie(String id) async {
    try {
      var response = await http.get(
        'https://api.themoviedb.org/3/movie/$id',
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

  Future<Map<String, dynamic>> getSimilarMovie(String id) async {
    try {
      var response = await http.get(
        'https://api.themoviedb.org/3/movie/$id/similar',
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

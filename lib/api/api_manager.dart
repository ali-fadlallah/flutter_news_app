import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/responses/News/NewsResponses.dart';
import 'package:news/api/responses/Sources/SourcesResponse.dart';

class ApiManager {

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstant.baseUrl, 'v2/top-headlines/sources',
        {'apiKey': ApiConstant.apiKey, 'category': categoryId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponses> getNews(String sourceID) async {
    Uri uri = Uri.https(ApiConstant.baseUrl, 'v2/everything', {
      'apiKey': ApiConstant.apiKey,
      'sources': sourceID,
    });

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponses.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponses> searchArticle(String keyword) async {
    Uri uri = Uri.https(ApiConstant.baseUrl, 'v2/everything', {
      'apiKey': ApiConstant.apiKey,
      'q': keyword,
    });

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponses.fromJson(json);
    return newsResponse;
  }
}

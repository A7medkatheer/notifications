import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/data/models/getnewsmodel.dart';

class GetNewsRepo {
  Future<GetNewsModel?> getNews() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-08-04&sortBy=publishedAt&apiKey=f5c1c580d27d4771925bae4afdd46406"));

      var decodedresponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        GetNewsModel myresponse = GetNewsModel.fromJson(decodedresponse);

        return myresponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}

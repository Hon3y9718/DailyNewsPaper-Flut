import 'dart:convert';

import 'package:dailynewspaper/Models/NewsPaperModel.dart';
import 'package:http/http.dart' as http;

class NewsPaperAPI {
  getNewsPaper(newsPaper) async {
    var response = await http.get(Uri.parse(
        "https://techicousnewspaperapi.herokuapp.com/getnewspaper/$newsPaper"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<NewsPaperModel> listOfNewsPaper = [];
      for (var i = 0; i < data.length; i++) {
        var model =
            NewsPaperModel(date: data[i]['date'], link: data[i]['link']);
        listOfNewsPaper.add(model);
      }
      return listOfNewsPaper;
    } else {
      return 'No Internet';
    }
  }

  getpdf(link) async {
    var dataToBePassed = jsonEncode({"url": link});
    var response = await http.post(
        Uri.parse("https://techicousnewspaperapi.herokuapp.com/getpdf"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: dataToBePassed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['url'];
    }
    return 'No Internet';
  }
}

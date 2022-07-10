import 'package:flutter/material.dart';
import 'package:mtt/models/qoutes_models.dart';
import 'package:http/http.dart' as http;

class API with ChangeNotifier {
  Qoutes qoutes = Qoutes(
    thought: Thought(
      naturalId: '',
      quote: '',
      quoteFragment: '',
      relatedAuthorThoughts: [],
      relatedThemeThoughts: [],
      shortUri: '',
      sortField: 0,
      thoughtAuthor: ThoughtAuthorElement(
        name: '',
        uri: '',
      ),
      thoughtThemes: [],
      uri: '',
      visible: true,
    ),
  );

  Future<void> getQoutes(String accountNumber) async {
    const url =
        'https://www.forbes.com/forbesapi/thought/uri.json?enrich=true&query=6504&relatedlimit=10';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    qoutes = Qoutes.fromJson(response.body);

    notifyListeners();
  }
}

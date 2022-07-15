import 'package:flutter/material.dart';
import 'package:mtt/models/qoute_of_the_day_model.dart';
import 'package:mtt/models/qoutes_models.dart';
import 'package:http/http.dart' as http;

class API with ChangeNotifier {
  QoutesModel qoutes = QoutesModel(
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

  QouteOfTheDayModel qouteOfTheDay = QouteOfTheDayModel(
    promotedContent: PromotedContent(
      brandvoiceHeader: false,
      channel: '',
      contentPositions: [],
      directLink: false,
      enableAds: false,
      filters: false,
      fullImage: false,
      fullListLink: false,
      location: '',
      more: false,
      pagination: false,
      removeBottomPadding: false,
      removeBvPrepend: false,
      removePadding: false,
      removeTopPadding: false,
      section: '',
      year: 0,
    ),
  );

  Future<void> getQoutes() async {
    const url =
        'https://www.forbes.com/forbesapi/thought/uri.json?enrich=true&query=6504&relatedlimit=10';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    qoutes = QoutesModel.fromJson(response.body);

    notifyListeners();
  }

  Future<void> getQouteOfTheDay() async {
    const url =
        'https://www.forbes.com/forbesapi/promote/get.json?location=thoughtoftheday';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    qouteOfTheDay = QouteOfTheDayModel.fromJson(response.body);

    notifyListeners();
  }
}

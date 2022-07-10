// To parse this JSON data, do
//
//     final qoutes = qoutesFromMap(jsonString);

import 'dart:convert';

class Qoutes {
  Qoutes({
    required this.thought,
  });

  final Thought thought;

  factory Qoutes.fromJson(String str) => Qoutes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Qoutes.fromMap(Map<String, dynamic> json) => Qoutes(
        thought: Thought.fromMap(json["thought"]),
      );

  Map<String, dynamic> toMap() => {
        "thought": thought.toMap(),
      };
}

class Thought {
  Thought({
    required this.naturalId,
    required this.quote,
    required this.quoteFragment,
    required this.uri,
    required this.sortField,
    required this.thoughtAuthor,
    required this.thoughtThemes,
    required this.relatedAuthorThoughts,
    required this.relatedThemeThoughts,
    required this.visible,
    required this.shortUri,
  });

  final String naturalId;
  final String quote;
  final String quoteFragment;
  final String uri;
  final int sortField;
  final ThoughtAuthorElement thoughtAuthor;
  final List<ThoughtAuthorElement> thoughtThemes;
  final List<Thought> relatedAuthorThoughts;
  final List<RelatedThemeThought> relatedThemeThoughts;
  final bool visible;
  final String shortUri;

  factory Thought.fromJson(String str) => Thought.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thought.fromMap(Map<String, dynamic> json) => Thought(
        naturalId: json["naturalId"],
        quote: json["quote"],
        quoteFragment: json["quoteFragment"],
        uri: json["uri"],
        sortField: json["sortField"],
        thoughtAuthor: ThoughtAuthorElement.fromMap(json["thoughtAuthor"]),
        thoughtThemes: List<ThoughtAuthorElement>.from(
            json["thoughtThemes"].map((x) => ThoughtAuthorElement.fromMap(x))),
        relatedAuthorThoughts: List<Thought>.from(
            json["relatedAuthorThoughts"].map((x) => Thought.fromMap(x))),
        relatedThemeThoughts: List<RelatedThemeThought>.from(
            json["relatedThemeThoughts"]
                .map((x) => RelatedThemeThought.fromMap(x))),
        visible: json["visible"],
        shortUri: json["shortUri"],
      );

  Map<String, dynamic> toMap() => {
        "naturalId": naturalId,
        "quote": quote,
        "quoteFragment": quoteFragment,
        "uri": uri,
        "sortField": sortField,
        "thoughtAuthor": thoughtAuthor.toMap(),
        "thoughtThemes":
            List<dynamic>.from(thoughtThemes.map((x) => x.toMap())),
        "relatedAuthorThoughts":
            List<dynamic>.from(relatedAuthorThoughts.map((x) => x.toMap())),
        "relatedThemeThoughts":
            List<dynamic>.from(relatedThemeThoughts.map((x) => x.toMap())),
        "visible": visible,
        "shortUri": shortUri,
      };
}

class RelatedThemeThought {
  RelatedThemeThought({
    required this.naturalId,
    required this.quote,
    required this.quoteFragment,
    required this.uri,
    required this.sortField,
    required this.thoughtAuthor,
    required this.thoughtThemes,
    required this.visible,
    required this.shortUri,
  });

  final String naturalId;
  final String quote;
  final String quoteFragment;
  final String uri;
  final int sortField;
  final ThoughtAuthor thoughtAuthor;
  final List<ThoughtAuthorElement> thoughtThemes;
  final bool visible;
  final String shortUri;

  factory RelatedThemeThought.fromJson(String str) =>
      RelatedThemeThought.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RelatedThemeThought.fromMap(Map<String, dynamic> json) =>
      RelatedThemeThought(
        naturalId: json["naturalId"],
        quote: json["quote"],
        quoteFragment: json["quoteFragment"],
        uri: json["uri"],
        sortField: json["sortField"],
        thoughtAuthor: ThoughtAuthor.fromMap(json["thoughtAuthor"]),
        thoughtThemes: List<ThoughtAuthorElement>.from(
            json["thoughtThemes"].map((x) => ThoughtAuthorElement.fromMap(x))),
        visible: json["visible"],
        shortUri: json["shortUri"],
      );

  Map<String, dynamic> toMap() => {
        "naturalId": naturalId,
        "quote": quote,
        "quoteFragment": quoteFragment,
        "uri": uri,
        "sortField": sortField,
        "thoughtAuthor": thoughtAuthor.toMap(),
        "thoughtThemes":
            List<dynamic>.from(thoughtThemes.map((x) => x.toMap())),
        "visible": visible,
        "shortUri": shortUri,
      };
}

class ThoughtAuthor {
  ThoughtAuthor({
    required this.name,
    required this.uri,
    required this.image,
  });

  final String name;
  final String uri;
  final String image;

  factory ThoughtAuthor.fromJson(String str) =>
      ThoughtAuthor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ThoughtAuthor.fromMap(Map<String, dynamic> json) => ThoughtAuthor(
        name: json["name"] ?? '',
        uri: json["uri"] ?? '',
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "uri": uri,
        "image": image,
      };
}

class ThoughtAuthorElement {
  ThoughtAuthorElement({
    required this.name,
    required this.uri,
  });

  final String name;
  final String uri;

  factory ThoughtAuthorElement.fromJson(String str) =>
      ThoughtAuthorElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ThoughtAuthorElement.fromMap(Map<String, dynamic> json) =>
      ThoughtAuthorElement(
        name: json["name"] ?? '',
        uri: json["uri"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "uri": uri,
      };
}

// To parse this JSON data, do
//
//     final qouteOfTheDayModel = qouteOfTheDayModelFromMap(jsonString);

import 'dart:convert';

class QouteOfTheDayModel {
  QouteOfTheDayModel({
    required this.promotedContent,
  });

  final PromotedContent? promotedContent;

  factory QouteOfTheDayModel.fromJson(String str) =>
      QouteOfTheDayModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QouteOfTheDayModel.fromMap(Map<String, dynamic> json) =>
      QouteOfTheDayModel(
        promotedContent: PromotedContent.fromMap(json["promotedContent"]),
      );

  Map<String, dynamic> toMap() => {
        "promotedContent":
            promotedContent == null ? null : promotedContent!.toMap(),
      };
}

class PromotedContent {
  PromotedContent({
    required this.channel,
    required this.section,
    required this.location,
    required this.contentPositions,
    required this.more,
    required this.enableAds,
    required this.removeBvPrepend,
    required this.brandvoiceHeader,
    required this.removePadding,
    required this.fullImage,
    required this.removeTopPadding,
    required this.removeBottomPadding,
    required this.fullListLink,
    required this.pagination,
    required this.filters,
    required this.year,
    required this.directLink,
  });

  final String? channel;
  final String? section;
  final String? location;
  final List<ContentPosition>? contentPositions;
  final bool? more;
  final bool? enableAds;
  final bool? removeBvPrepend;
  final bool? brandvoiceHeader;
  final bool? removePadding;
  final bool? fullImage;
  final bool? removeTopPadding;
  final bool? removeBottomPadding;
  final bool? fullListLink;
  final bool? pagination;
  final bool? filters;
  final int? year;
  final bool? directLink;

  factory PromotedContent.fromJson(String str) =>
      PromotedContent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PromotedContent.fromMap(Map<String, dynamic> json) => PromotedContent(
        channel: json["channel"],
        section: json["section"],
        location: json["location"],
        contentPositions: List<ContentPosition>.from(
            json["contentPositions"].map((x) => ContentPosition.fromMap(x))),
        more: json["more"],
        enableAds: json["enableAds"],
        removeBvPrepend: json["removeBVPrepend"],
        brandvoiceHeader: json["brandvoiceHeader"],
        removePadding: json["removePadding"],
        fullImage: json["fullImage"],
        removeTopPadding: json["removeTopPadding"],
        removeBottomPadding: json["removeBottomPadding"],
        fullListLink: json["fullListLink"],
        pagination: json["pagination"],
        filters: json["filters"],
        year: json["year"],
        directLink: json["directLink"],
      );

  Map<String, dynamic> toMap() => {
        "channel": channel,
        "section": section,
        "location": location,
        "contentPositions": contentPositions == null
            ? null
            : List<dynamic>.from(contentPositions!.map((x) => x.toMap())),
        "more": more,
        "enableAds": enableAds,
        "removeBVPrepend": removeBvPrepend,
        "brandvoiceHeader": brandvoiceHeader,
        "removePadding": removePadding,
        "fullImage": fullImage,
        "removeTopPadding": removeTopPadding,
        "removeBottomPadding": removeBottomPadding,
        "fullListLink": fullListLink,
        "pagination": pagination,
        "filters": filters,
        "year": year,
        "directLink": directLink,
      };
}

class ContentPosition {
  ContentPosition({
    required this.position,
    required this.type,
    required this.image,
    required this.description,
    required this.uri,
    required this.id,
    required this.authors,
    required this.shortUri,
    required this.hideDescription,
    required this.fullImage,
    required this.sponsored,
    required this.removeTopPadding,
    required this.removeBottomPadding,
  });

  final int? position;
  final String? type;
  final String? image;
  final String? description;
  final String? uri;
  final String? id;
  final List<Author>? authors;
  final String? shortUri;
  final bool? hideDescription;
  final bool? fullImage;
  final bool? sponsored;
  final bool? removeTopPadding;
  final bool? removeBottomPadding;

  factory ContentPosition.fromJson(String str) =>
      ContentPosition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentPosition.fromMap(Map<String, dynamic> json) => ContentPosition(
        position: json["position"],
        type: json["type"],
        image: json["image"],
        description: json["description"],
        uri: json["uri"],
        id: json["id"],
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromMap(x))),
        shortUri: json["shortUri"],
        hideDescription: json["hideDescription"],
        fullImage: json["fullImage"],
        sponsored: json["sponsored"],
        removeTopPadding: json["removeTopPadding"],
        removeBottomPadding: json["removeBottomPadding"],
      );

  Map<String, dynamic> toMap() => {
        "position": position,
        "type": type,
        "image": image,
        "description": description,
        "uri": uri,
        "id": id,
        "authors": authors == null
            ? null
            : List<dynamic>.from(authors!.map((x) => x.toMap())),
        "shortUri": shortUri,
        "hideDescription": hideDescription,
        "fullImage": fullImage,
        "sponsored": sponsored,
        "removeTopPadding": removeTopPadding,
        "removeBottomPadding": removeBottomPadding,
      };
}

class Author {
  Author({
    required this.name,
    required this.avatars,
    required this.url,
    required this.blog,
  });

  final String? name;
  final List<Avatar>? avatars;
  final String? url;
  final bool? blog;

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        name: json["name"],
        avatars:
            List<Avatar>.from(json["avatars"].map((x) => Avatar.fromMap(x))),
        url: json["url"],
        blog: json["blog"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "avatars": avatars == null
            ? null
            : List<dynamic>.from(avatars!.map((x) => x.toMap())),
        "url": url,
        "blog": blog,
      };
}

class Avatar {
  Avatar({
    required this.size,
    required this.image,
  });

  final int size;
  final String image;

  factory Avatar.fromJson(String str) => Avatar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Avatar.fromMap(Map<String, dynamic> json) => Avatar(
        size: json["size"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "size": size,
        "image": image,
      };
}

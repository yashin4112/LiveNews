// // To parse this JSON data, do
// //
// //     final sources = sourcesFromJson(jsonString);

// import 'dart:convert';

// class Sources {
//     Sources({
//       required this.status,
//       required this.sources,
//     });

//     final String status;
//     final List<Source> sources;

//     factory Sources.fromRawJson(String str) => Sources.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Sources.fromJson(Map<String, dynamic> json) => Sources(
//         status: json["status"],
//         sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
//     };
// }

// class Source {
//     Source({
//        required this.id,
//        required this.name,
//        required this.description,
//        required this.url,
//        required this.category,
//        required this.language,
//        required this.country,
//     });

//     final String id;
//     final String name;
//     final String description;
//     final String url;
//     final String category;
//     final String language;
//     final String country;

//     factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         url: json["url"],
//         category: json["category"],
//         language: json["language"],
//         country: json["country"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "url": url,
//         "category": category,
//         "language": language,
//         "country": country,
//     };
// }

class Source {
  final String id;
  final String name;

  Source({required this.name, required this.id});

}
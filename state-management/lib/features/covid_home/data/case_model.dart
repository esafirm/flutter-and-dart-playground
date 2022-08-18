import 'dart:convert';

class Case {
  final String id;
  final String message;
  final Global global;
  final List<Countries> countries;
  final DateTime date;

  Case({required this.id, required this.message, required this.global, required this.countries, required this.date});

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        id: json["ID"] as String,
        message: json["Message"] as String,
        global: Global.fromJson(json["Global"] as Map<String, dynamic>),
        countries: List<Countries>.from((json["Countries"] as Iterable).map(
          (x) => Countries.fromJson(x as Map<String, dynamic>),
        )),
        date: DateTime.parse(json["Date"] as String),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['Message'] = message;
    data['Global'] = global.toJson();
    data['Countries'] = countries.map((v) => v.toJson()).toList();
    data['Date'] = date;
    return data;
  }
}

class Global {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;

  Global(
      {required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered,
      required this.date});

  factory Global.fromJson(Map<String, dynamic> json) => Global(
        newConfirmed: json['NewConfirmed'] as int,
        totalConfirmed: json['TotalConfirmed'],
        newDeaths: json['NewDeaths'],
        totalDeaths: json['TotalDeaths'],
        newRecovered: json['NewRecovered'],
        totalRecovered: json['TotalRecovered'],
        date: DateTime.parse(json["Date"] as String),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}

class Countries {
  String id;
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;
  Premium premium;

  Countries(
      {required this.id,
      required this.country,
      required this.countryCode,
      required this.slug,
      required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecovered,
      required this.totalRecovered,
      required this.date,
      required this.premium});

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        id: json["ID"] as String,
        country: json["Country"] as String,
        countryCode: json["CountryCode"] as String,
        slug: json["Slug"] as String,
        newConfirmed: json["NewConfirmed"] as int,
        totalConfirmed: json["TotalConfirmed"] as int,
        newDeaths: json["NewDeaths"] as int,
        totalDeaths: json["TotalDeaths"] as int,
        newRecovered: json["NewRecovered"] as int,
        totalRecovered: json["TotalRecovered"] as int,
        date: DateTime.parse(json["Date"] as String),
        premium: Premium.fromJson(json["Premium"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    data['Premium'] = premium.toJson();
    return data;
  }
}

class Premium {
  Premium();

  factory Premium.fromRawJson(String str) => Premium.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Premium.fromJson(Map<String, dynamic> json) => Premium();

  Map<String, dynamic> toJson() => {};
}

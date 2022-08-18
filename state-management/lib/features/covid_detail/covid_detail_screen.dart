import 'dart:ui';

import 'package:clean_archetructure/features/covid_home/data/case_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CovidDetailScreen extends StatefulWidget {
  const CovidDetailScreen({Key? key}) : super(key: key);

  @override
  State<CovidDetailScreen> createState() => _CovidDetailScreenState();
}

class _CountryDetail {
  final String name;
  final String totalCase;
  final String totalDeath;
  final String totalRecovered;
  final String countryImage;

  _CountryDetail(this.name, this.totalCase, this.totalDeath, this.totalRecovered, this.countryImage);
}

class _CovidDetailScreenState extends State<CovidDetailScreen> {
  _CountryDetail? detail;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final countryName = ModalRoute.of(context)?.settings.arguments as String?;
      print("Country name: $countryName");

      final CaseProvider provider = Provider.of(context, listen: false);
      final currentCountries = provider.getCountryByName(countryName!);
      if (currentCountries != null) {
        setState(() {
          detail = _CountryDetail(
              countryName,
              currentCountries.totalConfirmed.toString(),
              currentCountries.totalDeaths.toString(),
              currentCountries.totalRecovered.toString(),
              "https://flagpedia.net/data/flags/normal/${currentCountries.countryCode.toLowerCase()}.png");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalCase = detail?.totalCase ?? '...';
    final totalDeath = detail?.totalDeath ?? '...';
    final totalRecovered = detail?.totalRecovered ?? '...';
    final image = detail?.countryImage ?? '';

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white10,
            title: Text(detail?.name ?? ''),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Total Case', style: TextStyle(fontSize: 30)),
                Text(totalCase, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const Text('Total Death', style: TextStyle(fontSize: 30)),
                Text(totalDeath, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const Text('Total Recovered', style: TextStyle(fontSize: 30)),
                Text(totalRecovered, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

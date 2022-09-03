import 'dart:ui';

import 'package:clean_archetructure/features/covid_home/data/case_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CovidCountriesScreen extends StatefulWidget {
  const CovidCountriesScreen({Key? key}) : super(key: key);

  @override
  State<CovidCountriesScreen> createState() => _CovidCountriesScreenState();
}

class _CountryItem {
  final String countryName;
  final String totalInfected;
  final String countryImage;

  _CountryItem(this.countryName, this.totalInfected, this.countryImage);
}

class _CovidCountriesScreenState extends State<CovidCountriesScreen> {
  List<_CountryItem> items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.linearToSrgbGamma(),
              image: NetworkImage(
                  "https://images.pexels.com/photos/3902882/pexels-photo-3902882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('Covid Case by Countries'),
              backgroundColor: Colors.white10,
            ),
            body: Center(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    final item = items[index];
                    return ListTile(
                      onTap: () => context.go('/countries/${item.countryName}'),
                      title: Text(item.countryName),
                      subtitle: Text(item.totalInfected),
                      trailing: CircleAvatar(
                        foregroundImage: NetworkImage(item.countryImage),
                      ),
                    );
                  })),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      CaseProvider provider = Provider.of(context, listen: false);
      setState(() {
        items = provider.countries
            .map((e) => _CountryItem(e.country, "Total cases: ${e.totalConfirmed.toString()}",
                "https://flagpedia.net/data/flags/normal/${e.countryCode.toLowerCase()}.png"))
            .toList();
      });
    });
  }
}

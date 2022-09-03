import 'package:clean_archetructure/features/covid_home/data/case_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CovidHomeScreen extends StatefulWidget {
  const CovidHomeScreen({Key? key}) : super(key: key);

  @override
  State<CovidHomeScreen> createState() => _CovidHomeScreenState();
}

class _CovidHomeScreenState extends State<CovidHomeScreen> {
  late CaseProvider provider;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      provider.load();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CaseProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withAlpha(100), BlendMode.lighten),
          image: const NetworkImage(
              "https://images.pexels.com/photos/3902882/pexels-photo-3902882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Covid Case"),
          backgroundColor: Colors.white10,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Total confirmed: ", style: TextStyle(fontSize: 30)),
              Text(provider.totalConfirmed, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Text("Total death: ", style: TextStyle(fontSize: 30)),
              Text(provider.totalDeaths, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () => provider.load(),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white10),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  child: const Icon(Icons.refresh, size: 30)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/countries'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white10),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))),
                child: const Text("Case by Countries"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

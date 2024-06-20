import 'package:flutter/material.dart';
import 'package:nba_app/models/NbaTeamModel.dart';
import 'package:nba_app/models/nba_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data>? nbaTeams = [];
  @override
  void initState() {
    _fetchData();

    // TODO: implement initState
    super.initState();
  }

  _fetchData() async {
    try {
      final nbaService = NbaService();
      await nbaService.getTeams();
      setState(() {
        nbaTeams = nbaService.nbaTeams;
      });
    } catch (e) {
      print("$e");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("length  ${nbaTeams!.length}");
    return (nbaTeams!.isEmpty)
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const Scaffold(
            body: Center(
              child: Icon(Icons.help_outline),
            ),
          );
  }
}

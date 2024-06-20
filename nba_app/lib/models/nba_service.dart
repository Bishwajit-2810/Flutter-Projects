import 'dart:convert';

import 'NbaTeamModel.dart';
import 'package:http/http.dart' as http;

class NbaService {
  List<Data>? nbaTeams = [];
  Future<NbaTeamModel> getTeamData() async {
    final response = await http.get(
      Uri.https("api.balldontlie.io", "v1/teams"),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return NbaTeamModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("failed");
    }
  }

  Future getTeams() async {
    NbaService nbaService = NbaService();
    final nbaTeamModel = await nbaService.getTeamData();
    nbaTeams = nbaTeamModel.data;
  }
}

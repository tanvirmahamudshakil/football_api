import 'package:flutter/services.dart';

class FootballApi {
  static final methodChannel = const MethodChannel('football_api');
  static Future<String?> _invoke(String method, [Map<String, dynamic>? args]) async {
    return await methodChannel.invokeMethod<String>(method, args);
  }

  static Future<String?> getLiveMatch() => _invoke("getLiveMatch");
  static Future<String?> getFixtureByDate(String date) =>
      _invoke("getFixtureByDate", {"date": date});
  static Future<String?> getTopScore(int league, int season) =>
      _invoke("getTopScore", {"league": league, "season": season});
  static Future<String?> getAllLeague() => _invoke("getAllLeague");
  static Future<String?> getTeamInfo(int teamid) => _invoke("getTeamInfo", {"teamid": teamid});
  static Future<String?> getStanding(int league, int season) =>
      _invoke("getStanding", {"league": league, "season": season});
  static Future<String?> getStatistics(int fixtureid) =>
      _invoke("getStatistics", {"fixtureid": fixtureid});
  static Future<String?> getLineup(int fixtureid) => _invoke("getLineup", {"fixtureid": fixtureid});
  static Future<String?> getPlayerStatistic(int fixtureid) =>
      _invoke("getPlayerStatistic", {"fixtureid": fixtureid});
  static Future<String?> getFixtureEvent(int fixtureid) =>
      _invoke("getFixtureEvent", {"fixtureid": fixtureid});
  static Future<String?> getHeadToHead(String headtoheadid) =>
      _invoke("getHeadToHead", {"headtoheadid": headtoheadid});
  static Future<String?> getPlayerTransfer(int teamid, int playerid) =>
      _invoke("getPlayerTransfer", {"teamid": teamid, "playerid": playerid});
  static Future<String?> getSinglePlayerInfo(int season, int playerid) =>
      _invoke("getSinglePlayerInfo", {"season": season, "playerid": playerid});
  static Future<String?> getPoll(int matchid) => _invoke("getPoll", {"matchid": matchid});
  static Future<String?> pollUpdate(
          int matchid, int home, int away, String homename, String awayname, int draw) =>
      _invoke("pollUpdate", {
        "matchid": matchid,
        "home": home,
        "away": away,
        "homename": homename,
        "awayname": awayname,
        "draw": draw
      });
  static Future<String?> getPlayerBySeasonLeague(int leagueId, int season) =>
      _invoke("getPlayerBySeasonLeague", {"leagueId": leagueId, "season": season});
  static Future<String?> getCountryByTeam(String countryname) =>
      _invoke("getCountryByTeam", {"countryname": countryname});
  static Future<String?> getStandingByLeagueTeamSeason(int teamID, int season, int leagueid) =>
      _invoke("getStandingByLeagueTeamSeason",
          {"teamID": teamID, "season": season, "leagueid": leagueid});
  static Future<String?> getStandingByTeamSeason(int teamID, int season) =>
      _invoke("getStandingByTeamSeason", {"teamID": teamID, "season": season});
  static Future<String?> getPlayerTeam(int teamID) => _invoke("getPlayerTeam", {"teamID": teamID});
  static Future<String?> getTransferByTeam(int teamID) =>
      _invoke("getTransferByTeam", {"teamID": teamID});
  static Future<String?> getLeagueByTeam(int teamID) =>
      _invoke("getLeagueByTeam", {"teamID": teamID});
  static Future<String?> getLeagueSearch(String leagueName) =>
      _invoke("getLeagueSearch", {"leagueName": leagueName});
  static Future<String?> getPlayerSearch(String playerName) =>
      _invoke("getPlayerSearch", {"playerName": playerName});
  static Future<String?> getTeamSearch(String teamName) =>
      _invoke("getTeamSearch", {"teamName": teamName});
  static Future<String?> getLeagueByCountry(String countryName) =>
      _invoke("getLeagueByCountry", {"countryName": countryName});
  static Future<String?> getAllCountry() => _invoke("getAllCountry");
  static Future<String?> getAllTeamByLeagueId(int league, int season) =>
      _invoke("getAllTeamByLeagueId", {"league": league, "season": season});
  static Future<String?> getTeamMatch(int teamid, int season) =>
      _invoke("getTeamMatch", {"teamid": teamid, "season": season});
  static Future<String?> getTeamStatistics(int teamid, int league, int season) =>
      _invoke("getTeamStatistics", {"teamid": teamid, "league": league, "season": season});
  static Future<String?> getFixtureDetails(int fixture) =>
      _invoke("getFixtureDetails", {"fixture": fixture});
  static Future<String?> getFixtureLeagueDate(String date, int league, int season) =>
      _invoke("getFixtureLeagueDate", {"date": date, "league": league, "season": season});
  static Future<String?> getTeamPlayerList(int teamid, int season) =>
      _invoke("getTeamPlayerList", {"teamid": teamid, "season": season});
  static Future<String?> getPlayerListSeasonLeagueTeam(int teamid, int season, int leagueid) =>
      _invoke("getPlayerListSeasonLeagueTeam",
          {"teamid": teamid, "season": season, "leagueid": leagueid});
  static Future<String?> getPlayerSquad(int playerid) =>
      _invoke("getPlayerSquad", {"playerid": playerid});
  static Future<String?> getLeagueFixture(int league, int season) =>
      _invoke("getLeagueFixture", {"league": league, "season": season});
  static Future<String?> getTrophy(int playerid) => _invoke("getTrophy", {"playerid": playerid});
  static Future<String?> getTransfer(int playerid) =>
      _invoke("getTransfer", {"playerid": playerid});
  static Future<String?> getTopLeague() => _invoke("getTopLeague");
  static Future<String?> getAllLeagueByTeam(int teamid) =>
      _invoke("getAllLeagueByTeam", {"teamid": teamid});
  static Future<String?> getSingleLeague(int leagueid) =>
      _invoke("getSingleLeague", {"leagueid": leagueid});
  static Future<String?> getMultipleFixtureById(String fixtureids) =>
      _invoke("getMultipleFixtureById", {"fixtureids": fixtureids});

  // @override
  // Future<String?> get getlivematch async {
  //   final version = await methodChannel.invokeMethod<String>('getlivematch');
  //   return version;
  // }

  // @override
  // Future<String?> getfixturematchbydate({required String date}) async {
  //   final version = await methodChannel
  //       .invokeMethod<String>('getfixturematchbydate', {"date": date});
  //   return version;
  // }

  // @override
  // Future<String?> get getallleague async {
  //   final version = await methodChannel.invokeMethod<String>('getallleague');
  //   return version;
  // }

  // @override
  // Future<String?> getstatistics({int fixtureid = 866612}) async {
  //   final version = await methodChannel
  //       .invokeMethod<String>('getstatistics', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?> getstanding({int league = 39, int season = 2019}) async {
  //   final version = await methodChannel.invokeMethod<String>(
  //       'getstanding', {"league": league, "season": season});
  //   return version;
  // }

  // @override
  // Future<String?> getallteambyleagueid(
  //     {int season = 2019, int league = 39}) async {
  //   final version = await methodChannel.invokeMethod<String>(
  //       'getallteambyleagueid', {"season": season, "league": league});
  //   return version;
  // }

  // @override
  // Future<String?>  getteammatch({int team=33, int season=2019}) async {
  //   final version = await methodChannel.invokeMethod<String>('getteammatch', {"team": team, "season": season});
  //   return version;
  // }

  // @override
  // Future<String?>  getteaminfo({int team=33}) async {
  //   final version = await methodChannel.invokeMethod<String>('getteaminfo', {"team": team});
  //   return version;
  // }

  // @override
  // Future<String?>  getteamstatiaties({int league=39, int team=33, int season=2019}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getteamstatiaties', {"league": league, "team": team, "season": season});
  //   return version;
  // }

  // @override
  // Future<String?>  getfixturedetails({int fixtureid=978072}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getfixturedetails', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?>  getheadtohead({int teamA= 33, int teamB = 34}) async {
  //   final version = await methodChannel.invokeMethod<String>('getheadtohead', {"h2h": "$teamA-$teamB"});
  //   return version;
  // }

  // @override
  // Future<String?>  getlineup({int fixtureid = 36584}) async {
  //   final version = await methodChannel.invokeMethod<String>('getlineup', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?>  getfixturestatistic({int fixtureid = 36584}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getfixturestatistic', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?>  getplayerstatistic({int fixtureid = 36584}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getplayerstatistic', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?>  getfixtureevent({int fixtureid = 36584}) async {
  //   final version = await methodChannel.invokeMethod<String>('getfixtureevent',{"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?>  getfixtureleaguedate({String date="2022-10-05", int league=807, int season=2022}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getfixtureleaguedate', {"date": date, "league": league, "season": season});
  //   return version;
  // }

  // @override
  // Future<String?>  getteamplayerlist({int season=2022, int teamid=140}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getteamplayerlist', {"season": season, "team": teamid});
  //   return version;
  // }

  // @override
  // Future<String?>  getplayerlistseasonleagueteam({int season=2022, int teamid=33, int leagueid=61}) async {
  //   final version = await methodChannel
  //       .invokeMethod<String>('getplayerlistseasonleagueteam', {"season": season, "team": teamid, "league": leagueid});
  //   return version;
  // }

  // @override
  // Future<String?>  getplayertransfer({int player=35845, int teamid=463}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getplayertransfer', {"player": player, "team": teamid});
  //   return version;
  // }

  // @override
  // Future<String?>  getsingleplayerinfo({int player=35845, int season=2019}) async {
  //   final version =
  //       await methodChannel.invokeMethod<String>('getsingleplayerinfo', {"player": player, "season": season});
  //   return version;
  // }

  // @override
  // Future<String?>  getplayersquard({int player=35845}) async {
  //   final version = await methodChannel.invokeMethod<String>('getplayersquard', {"player": player});
  //   return version;
  // }

  // @override
  // Future<String?>  getleague_fixture({int season=2022,  int leagueid=61}) async {
  //   final version = await methodChannel.invokeMethod<String>('getleague_fixture', {"season": season, "league": leagueid});
  //   return version;
  // }

  // @override
  // Future<String?>  gettop_score({int season=2022,  int leagueid=61}) async {
  //   final version = await methodChannel.invokeMethod<String>('gettopscore', {"season": season, "league": leagueid});
  //   return version;
  // }
  // @override
  // Future<String?>  gettransfer({int player=35845}) async {
  //   final version = await methodChannel.invokeMethod<String>('gettransfer', {"player": player});
  //   return version;
  // }
  // @override
  // Future<String?>  gettrophy({int player=35845}) async {
  //   final version = await methodChannel.invokeMethod<String>('gettrophy', {"player": player});
  //   return version;
  // }

  // @override
  // Future<String?> gettopleague() async {
  //   final version = await methodChannel.invokeMethod<String>('gettopleague');
  //   return version;
  // }

  // @override
  // Future<String?> getpoll({int fixtureid = 36584}) async {
  //   final version = await methodChannel.invokeMethod<String>('poll', {"fixtureid": fixtureid});
  //   return version;
  // }

  // @override
  // Future<String?> updatepoll({int fixtureid = 36584, int home = 25, int away = 56,String homename = "sdsdv", String awayname = "", int draw = 5}) async {
  //   final version = await methodChannel.invokeMethod<String>('poll', {"fixtureid": fixtureid , "home" : home,"away" :away, "homename" :homename, "awayname" :awayname, "draw" :draw, });
  //   return version;
  // }
  // @override
  // Future<String?> getleaguebyteamid({int teamid = 33}) async {
  //   final version = await methodChannel.invokeMethod<String>('allleaguebyteam', {"teamid": teamid});
  //   return version;
  // }
  // @override
  // Future<String?> getsingleleague({int leagueid = 33}) async {
  //   final version = await methodChannel.invokeMethod<String>('singleleague', {"leagueid": leagueid});
  //   return version;
  // }

  // @override
  // Future<String?> getmultpleFixture({String? fixtureid}) async {
  //   final version = await methodChannel.invokeMethod<String>("multfixture",{"fixtureids": fixtureid});
  //  return version;
  // }
}

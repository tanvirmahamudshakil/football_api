import 'package:flutter/services.dart';

class FootballApi {
  final methodChannel = const MethodChannel('football_api');

  @override
  Future<String?> get getlivematch async {
    final version = await methodChannel.invokeMethod<String>('getlivematch');
    return version;
  }

  @override
  Future<String?> getfixturematchbydate({required String date}) async {
    final version = await methodChannel
        .invokeMethod<String>('getfixturematchbydate', {"date": date});
    return version;
  }

  @override
  Future<String?> get getallleague async {
    final version = await methodChannel.invokeMethod<String>('getallleague');
    return version;
  }

  @override
  Future<String?> getstatistics({int fixtureid = 866612}) async {
    final version = await methodChannel
        .invokeMethod<String>('getstatistics', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?> getstanding({int league = 39, int season = 2019}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getstanding', {"league": league, "season": season});
    return version;
  }

  @override
  Future<String?> getallteambyleagueid(
      {int season = 2019, int league = 39}) async {
    final version = await methodChannel.invokeMethod<String>(
        'getallteambyleagueid', {"season": season, "league": league});
    return version;
  }

  @override
  Future<String?>  getteammatch({int team=33, int season=2019}) async {
    final version = await methodChannel.invokeMethod<String>('getteammatch', {"team": team, "season": season});
    return version;
  }

  @override
  Future<String?>  getteaminfo({int team=33}) async {
    final version = await methodChannel.invokeMethod<String>('getteaminfo', {"team": team});
    return version;
  }

  @override
  Future<String?>  getteamstatiaties({int league=39, int team=33, int season=2019}) async {
    final version =
        await methodChannel.invokeMethod<String>('getteamstatiaties', {"league": league, "team": team, "season": season});
    return version;
  }

  @override
  Future<String?>  getfixturedetails({int fixtureid=978072}) async {
    final version =
        await methodChannel.invokeMethod<String>('getfixturedetails', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?>  getheadtohead({int teamA= 33, int teamB = 34}) async {
    final version = await methodChannel.invokeMethod<String>('getheadtohead', {"h2h": "${teamA}-${teamB}"});
    return version;
  }

  @override
  Future<String?>  getlineup({int fixtureid = 36584}) async {
    final version = await methodChannel.invokeMethod<String>('getlineup', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?>  getfixturestatistic({int fixtureid = 36584}) async {
    final version =
        await methodChannel.invokeMethod<String>('getfixturestatistic', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?>  getplayerstatistic({int fixtureid = 36584}) async {
    final version =
        await methodChannel.invokeMethod<String>('getplayerstatistic', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?>  getfixtureevent({int fixtureid = 36584}) async {
    final version = await methodChannel.invokeMethod<String>('getfixtureevent',{"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?>  getfixtureleaguedate({String date="2022-10-05", int league=807, int season=2022}) async {
    final version =
        await methodChannel.invokeMethod<String>('getfixtureleaguedate', {"date": date, "league": league, "season": season});
    return version;
  }

  @override
  Future<String?>  getteamplayerlist({int season=2022, int teamid=140}) async {
    final version =
        await methodChannel.invokeMethod<String>('getteamplayerlist', {"season": season, "team": teamid});
    return version;
  }

  @override
  Future<String?>  getplayerlistseasonleagueteam({int season=2022, int teamid=33, int leagueid=61}) async {
    final version = await methodChannel
        .invokeMethod<String>('getplayerlistseasonleagueteam', {"season": season, "team": teamid, "league": leagueid});
    return version;
  }

  @override
  Future<String?>  getplayertransfer({int player=35845, int teamid=463}) async {
    final version =
        await methodChannel.invokeMethod<String>('getplayertransfer', {"player": player, "team": teamid});
    return version;
  }

  @override
  Future<String?>  getsingleplayerinfo({int player=35845, int season=2019}) async {
    final version =
        await methodChannel.invokeMethod<String>('getsingleplayerinfo', {"player": player, "season": season});
    return version;
  }

  @override
  Future<String?>  getplayersquard({int player=35845}) async {
    final version = await methodChannel.invokeMethod<String>('getplayersquard', {"player": player});
    return version;
  }

  @override
  Future<String?>  getleague_fixture({int season=2022,  int leagueid=61}) async {
    final version = await methodChannel.invokeMethod<String>('getleague_fixture', {"season": season, "league": leagueid});
    return version;
  }


  @override
  Future<String?>  gettop_score({int season=2022,  int leagueid=61}) async {
    final version = await methodChannel.invokeMethod<String>('gettopscore', {"season": season, "league": leagueid});
    return version;
  }
  @override
  Future<String?>  gettransfer({int player=35845}) async {
    final version = await methodChannel.invokeMethod<String>('gettransfer', {"player": player});
    return version;
  }
  @override
  Future<String?>  gettrophy({int player=35845}) async {
    final version = await methodChannel.invokeMethod<String>('gettrophy', {"player": player});
    return version;
  }

  @override
  Future<String?> gettopleague() async {
    final version = await methodChannel.invokeMethod<String>('gettopleague');
    return version;
  }

  @override
  Future<String?> getpoll({int fixtureid = 36584}) async {
    final version = await methodChannel.invokeMethod<String>('poll', {"fixtureid": fixtureid});
    return version;
  }

  @override
  Future<String?> updatepoll({int fixtureid = 36584, int home = 25, int away = 56,String homename = "sdsdv", String awayname = "", int draw = 5}) async {
    final version = await methodChannel.invokeMethod<String>('poll', {"fixtureid": fixtureid , "home" : home,"away" :away, "homename" :homename, "awayname" :awayname, "draw" :draw, });
    return version;
  }
  @override
  Future<String?> getleaguebyteamid({int teamid = 33}) async {
    final version = await methodChannel.invokeMethod<String>('allleaguebyteam', {"teamid": teamid});
    return version;
  }
  @override
  Future<String?> getsingleleague({int leagueid = 33}) async {
    final version = await methodChannel.invokeMethod<String>('singleleague', {"leagueid": leagueid});
    return version;
  }

  @override
  Future<String?> getmultpleFixture({String? fixtureid}) async {
    final version = await methodChannel.invokeMethod<String>("multfixture",{"fixtureids": fixtureid});
   return version;
  }

}

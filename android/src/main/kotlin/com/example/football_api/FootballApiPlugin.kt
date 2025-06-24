package com.example.football_api

import android.content.Context
import androidx.annotation.NonNull
import com.example.spors_api.Http.api

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/** FootballApiPlugin */
class FootballApiPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity


  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private lateinit var api: api
//     private  var getlivematch : String = "getlivematch";
//private  var getfixturematchbydate : String = "getfixturematchbydate";
//private  var getallleague : String = "getallleague";
//private  var getstatistics : String = "getstatistics";
//
//private  var getstanding : String = "getstanding";
//private  var getallteambyleagueid : String = "getallteambyleagueid";
//
//private  var getteammatch : String = "getteammatch";
//private  var getteaminfo : String = "getteaminfo";
//
//private  var getteamstatiaties : String = "getteamstatiaties";
//
//
//private  var getfixturedetails : String = "getfixturedetails";
//private  var getheadtohead : String = "getheadtohead";
//
//private  var getlineup : String = "getlineup";
//private  var getfixturestatistic : String = "getfixturestatistic";
//
//private  var getplayerstatistic : String = "getplayerstatistic";
//private  var getfixtureevent : String = "getfixtureevent";
//
//private  var getfixtureleaguedate : String = "getfixtureleaguedate";
//private  var getteamplayerlist : String = "getteamplayerlist";
//private  var getplayerlistseasonleagueteam : String = "getplayerlistseasonleagueteam";
//
//private  var getplayertransfer : String = "getplayertransfer";
//private  var getsingleplayerinfo : String = "getsingleplayerinfo";
//
//private  var getplayersquard : String = "getplayersquard";
//  private var getleague_fixture : String ="getleague_fixture";
//  private var gettopscore : String ="gettopscore";
//  private var gettrophy : String ="gettrophy";
//  private var gettransfer : String ="gettransfer";
//  private var gettopleague : String ="gettopleague";
//  private var poll : String ="poll";
//  private var pollupdate : String ="pollupdate";
//  private var allleaguebyteam : String ="allleaguebyteam";
//  private var singleleague : String ="singleleague";
//  private var multfixture : String ="multfixture";


   

  

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "football_api")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    api = api(context)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    fun runApi(block: suspend () -> String?) = CoroutineScope(Dispatchers.IO).launch {
      val response = block()
      withContext(Dispatchers.Main) {
        result.success(response)
      }
    }

    when (call.method) {
      "getLiveMatch" -> runApi { api.getlivematch() }
      "getFixtureByDate" -> runApi { api.getfixturematchbydate(call.argument("date") ?: "") }
      "getTopScore" -> runApi { api.gettop_score(call.argument("league") ?: 0, call.argument("season") ?: 0) }
      "getAllLeague" -> runApi { api.getallleague() }
      "getTeamInfo" -> runApi { api.getteaminfo(call.argument("teamid") ?: 0) }
      "getStanding" -> runApi { api.getstanding(call.argument("league") ?: 0, call.argument("season") ?: 0) }
      "getStatistics" -> runApi { api.getstatistics(call.argument("fixtureid") ?: 0) }
      "getLineup" -> runApi { api.getlineup(call.argument("fixtureid") ?: 0) }
      "getPlayerStatistic" -> runApi { api.getplayerstatistic(call.argument("fixtureid") ?: 0) }
      "getFixtureEvent" -> runApi { api.getfixtureevent(call.argument("fixtureid") ?: 0) }
      "getHeadToHead" -> runApi { api.getheadtohead(call.argument("headtoheadid") ?: "") }
      "getPlayerTransfer" -> runApi { api.getplayertransfer(call.argument("teamid") ?: 0, call.argument("playerid") ?: 0) }
      "getSinglePlayerInfo" -> runApi { api.getsingleplayerinfo(call.argument("season") ?: 0, call.argument("playerid") ?: 0) }
      "getPoll" -> runApi { api.getpoll(call.argument("matchid") ?: 0) }
      "pollUpdate" -> runApi {
        api.pollupdate(
          call.argument("matchid") ?: 0,
          call.argument("home") ?: 0,
          call.argument("away") ?: 0,
          call.argument("homename") ?: "",
          call.argument("awayname") ?: "",
          call.argument("draw") ?: 0
        )
      }
      "getPlayerBySeasonLeague" -> runApi { api.getPlayerBySeasonleague(call.argument("leagueId") ?: 0, call.argument("season") ?: 0) }
      "getCountryByTeam" -> runApi { api.getCountryByTeam(call.argument("countryname") ?: "") }
      "getStandingByLeagueTeamSeason" -> runApi {
        api.getStandingByLeagueTeamSeason(
          call.argument("teamID") ?: 0,
          call.argument("season") ?: 0,
          call.argument("leagueid") ?: 0
        )
      }
      "getStandingByTeamSeason" -> runApi {
        api.getStandingByTeamSeason(call.argument("teamID") ?: 0, call.argument("season") ?: 0)
      }
      "getPlayerTeam" -> runApi { api.getPlayerTeam(call.argument("teamID") ?: 0) }
      "getTransferByTeam" -> runApi { api.getTransferByTeam(call.argument("teamID") ?: 0) }
      "getLeagueByTeam" -> runApi { api.getLeagueByTeam(call.argument("teamID") ?: 0) }
      "getLeagueSearch" -> runApi { api.getLeagueSearch(call.argument("leagueName") ?: "") }
      "getPlayerSearch" -> runApi { api.getPlayerSearch(call.argument("playerName") ?: "") }
      "getTeamSearch" -> runApi { api.getTeamSearch(call.argument("teamName") ?: "") }
      "getLeagueByCountry" -> runApi { api.getleagyeByCountry(call.argument("countryName") ?: "") }
      "getAllCountry" -> runApi { api.getAllCountry() }
      "getAllTeamByLeagueId" -> runApi {
        api.getallteambyleagueid(call.argument("league") ?: 0, call.argument("season") ?: 0)
      }
      "getTeamMatch" -> runApi {
        api.getteammatch(call.argument("teamid") ?: 0, call.argument("season") ?: 0)
      }
      "getTeamStatistics" -> runApi {
        api.getteamstatiaties(
          call.argument("teamid") ?: 0,
          call.argument("league") ?: 0,
          call.argument("season") ?: 0
        )
      }
      "getFixtureDetails" -> runApi { api.getfixturedetails(call.argument("fixture") ?: 0) }
      "getFixtureLeagueDate" -> runApi {
        api.getfixtureleaguedate(
          call.argument("date") ?: "",
          call.argument("league") ?: 0,
          call.argument("season") ?: 0
        )
      }
      "getTeamPlayerList" -> runApi {
        api.getteamplayerlist(call.argument("teamid") ?: 0, call.argument("season") ?: 0)
      }
      "getPlayerListSeasonLeagueTeam" -> runApi {
        api.getplayerlistseasonleagueteam(
          call.argument("teamid") ?: 0,
          call.argument("season") ?: 0,
          call.argument("leagueid") ?: 0
        )
      }
      "getPlayerSquad" -> runApi { api.getplayersquard(call.argument("playerid") ?: 0) }
      "getLeagueFixture" -> runApi {
        api.getleague_fixture(call.argument("league") ?: 0, call.argument("season") ?: 0)
      }
      "getTrophy" -> runApi { api.gettrophy(call.argument("playerid") ?: 0) }
      "getTransfer" -> runApi { api.gettransfer(call.argument("playerid") ?: 0) }
      "getTopLeague" -> runApi { api.gettopleague() }
      "getAllLeagueByTeam" -> runApi { api.allleaguebyteam(call.argument("teamid") ?: 0) }
      "getSingleLeague" -> runApi { api.singleleague(call.argument("leagueid") ?: 0) }
      "getMultipleFixtureById" -> runApi { api.multipleFixtureById(call.argument("fixtureids") ?: "") }
      else -> result.notImplemented()
    }
  }


//  fun apihelp(call: MethodCall, result: Result) {
//    if (call.method == getlivematch) {
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getlivematch()
//        result.success("${data}")
//      }
//
//    } else if (call.method == getfixturematchbydate) {
//      var date : String? = call.argument<String>("date")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getfixturematchbydate(date!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getallleague) {
//
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getallleague()
//        result.success("${data}")
//      }
//    }else if (call.method == getstatistics) {
//      CoroutineScope(Dispatchers.IO).async {
//        var date : Int? = call.argument<Int>("fixtureid")
//        var data = api(context).getstatistics(date!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getstanding) {
//      CoroutineScope(Dispatchers.IO).async {
//        var league : Int? = call.argument<Int>("league")
//        var season : Int? = call.argument<Int>("season")
//        var data = api(context).getstanding(league!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getallteambyleagueid) {
//       var league : Int? = call.argument<Int>("league")
//        var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getallteambyleagueid(league!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getteammatch) {
//      var team : Int? = call.argument<Int>("team")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getteammatch(team!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getteaminfo) {
//      CoroutineScope(Dispatchers.IO).async {
//        var team : Int? = call.argument<Int>("team")
//        var data = api(context).getteaminfo(team!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getteamstatiaties) {
//      var league : Int? = call.argument<Int>("league")
//      var team : Int? = call.argument<Int>("team")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getteamstatiaties(team!!, league!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getfixturedetails) {
//      var fixtureid : Int? = call.argument<Int>("fixtureid")
//
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getfixturedetails(fixtureid!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getheadtohead) {
//      var h2h : String? = call.argument<String>("h2h")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getheadtohead(h2h!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getlineup) {
//      var fixtureid : Int? = call.argument<Int>("fixtureid")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getlineup(fixtureid!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getfixturestatistic) {
//      var fixtureid : Int? = call.argument<Int>("fixtureid")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getfixturestatistic(fixtureid!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getplayerstatistic) {
//      var fixtureid : Int? = call.argument<Int>("fixtureid")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getplayerstatistic(fixtureid!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getfixtureevent) {
//      var fixtureid : Int? = call.argument<Int>("fixtureid")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getfixtureevent(fixtureid!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getfixtureleaguedate) {
//      var league : Int? = call.argument<Int>("league")
//      var date : String? = call.argument<String>("date")
//      var season : Int? = call.argument<Int>("season")
//
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getfixtureleaguedate(date!!, league!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getteamplayerlist) {
//      var team : Int? = call.argument<Int>("team")
//      var season : Int? = call.argument<Int>("season")
//
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getteamplayerlist(team!!, season!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getplayerlistseasonleagueteam) {
//      var league : Int? = call.argument<Int>("league")
//      var team : Int? = call.argument<Int>("team")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getplayerlistseasonleagueteam(team!!, season!!, league!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getplayertransfer) {
//      var player : Int? = call.argument<Int>("player")
//      var team : Int? = call.argument<Int>("team")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getplayertransfer(team!!, player!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getsingleplayerinfo) {
//      var player : Int? = call.argument<Int>("player")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getsingleplayerinfo(season!!, player!!)
//        result.success("${data}")
//      }
//    }else if (call.method == getplayersquard) {
//      var player : Int? = call.argument<Int>("player")
//      CoroutineScope(Dispatchers.IO).async {
//
//        var data = api(context).getplayersquard(player!!)
//        result.success("${data}")
//      }
//    }else if(call.method == getleague_fixture){
//      var league : Int? = call.argument<Int>("league")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getleague_fixture(league!!, season!!)
//        result.success("${data}")
//      }
//    }else if(call.method == gettopscore){
//      var league : Int? = call.argument<Int>("league")
//      var season : Int? = call.argument<Int>("season")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).gettop_score(league!!, season!!)
//        result.success("${data}")
//      }
//    }else if(call.method == gettrophy){
//      var player : Int? = call.argument<Int>("player")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).gettrophy(player!!)
//        result.success("${data}")
//      }
//    }
//    else if(call.method == gettransfer){
//      var player : Int? = call.argument<Int>("player")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).gettransfer(player!!)
//        result.success("${data}")
//      }
//    }else if(call.method == gettopleague) {
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).gettopleague()
//        result.success("${data}")
//      }
//    } else if(call.method == allleaguebyteam) {
//      var teamid : Int? = call.argument<Int>("teamid")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).allleaguebyteam(teamid!!)
//        result.success("${data}")
//      }
//    } else if(call.method == singleleague) {
//      var leagueid : Int? = call.argument<Int>("leagueid")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).singleleague(leagueid!!)
//        result.success("${data}")
//      }
//    }
//    else if(call.method == poll) {
//      var fixture : Int? = call.argument<Int>("fixtureid")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).getpoll(fixture!!)
//        result.success("${data}")
//      }
//    }else if(call.method == pollupdate) {
//      var fixture : Int? = call.argument<Int>("fixtureid")
//      var home : Int? = call.argument<Int>("home")
//      var away : Int? = call.argument<Int>("away")
//      var homename : String? = call.argument<String>("homename")
//      var awayname : String? = call.argument<String>("awayname")
//      var draw : Int? = call.argument<Int>("draw")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).pollupdate(fixture!!,home!!,away!!,homename!!,awayname!!,draw!!)
//        result.success("${data}")
//      }
//    }else if(call.method == multfixture){
//      var fixtures : String? = call.argument<String>("fixtureids")
//      CoroutineScope(Dispatchers.IO).async {
//        var data = api(context).multipleFixtureById(fixtures!!)
//        result.success("${data}")
//      }
//    }
//
//    else {
//      result.notImplemented()
//    }
//  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

}

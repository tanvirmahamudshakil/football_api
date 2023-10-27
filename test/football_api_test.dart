import 'package:flutter_test/flutter_test.dart';
import 'package:football_api/football_api.dart';
import 'package:football_api/football_api_platform_interface.dart';
import 'package:football_api/football_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFootballApiPlatform
    with MockPlatformInterfaceMixin
    implements FootballApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FootballApiPlatform initialPlatform = FootballApiPlatform.instance;

  test('$MethodChannelFootballApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFootballApi>());
  });

  test('getPlatformVersion', () async {
    FootballApi footballApiPlugin = FootballApi();
    MockFootballApiPlatform fakePlatform = MockFootballApiPlatform();
    FootballApiPlatform.instance = fakePlatform;

    expect(await footballApiPlugin.getPlatformVersion(), '42');
  });
}

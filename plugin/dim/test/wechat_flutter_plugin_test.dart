import 'package:flutter_test/flutter_test.dart';
import 'package:wechat_flutter_plugin/wechat_flutter_plugin.dart';
import 'package:wechat_flutter_plugin/wechat_flutter_plugin_platform_interface.dart';
import 'package:wechat_flutter_plugin/wechat_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWechatFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements WechatFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WechatFlutterPluginPlatform initialPlatform = WechatFlutterPluginPlatform.instance;

  test('$MethodChannelWechatFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWechatFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    WechatFlutterPlugin wechatFlutterPlugin = WechatFlutterPlugin();
    MockWechatFlutterPluginPlatform fakePlatform = MockWechatFlutterPluginPlatform();
    WechatFlutterPluginPlatform.instance = fakePlatform;

    expect(await wechatFlutterPlugin.getPlatformVersion(), '42');
  });
}

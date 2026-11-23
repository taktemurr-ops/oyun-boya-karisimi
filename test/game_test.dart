import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_boya_karisimi/oyun_boya_karisimi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(boyaKarisimiConfig.title.length, 33);
    expect(boyaKarisimiConfig.tagline.length, 33);
    for (final s in boyaKarisimiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(boyaKarisimiConfig.gameId, boyaKarisimiId);
    expect(boyaKarisimiRules.gameId, boyaKarisimiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(boyaKarisimiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: boyaKarisimiId, optionalMechanics: boyaKarisimiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(boyaKarisimiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

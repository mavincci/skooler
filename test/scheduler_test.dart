import 'dart:math';

import 'package:skooler/src/scheduler.dart';
import 'package:test/test.dart';

List<int> genRandom(int size, int max) {
  List<int> temp = [];
  Random random = Random();

  for (int i = 0; i < random.nextInt(size); ++i) {
    temp.add(random.nextInt(max));
  }

  return temp;
}

void main() {
  group('A group of tests', () {
    final int ps = 5;
    final int ts = 10;

    final Scheduler scheduler = Scheduler();
    // final List<Teacher> teachers =
    //     List.generate(ts, (index) => Teacher(index, genRandom(ps, ps)));

    final List<Teacher> teachers2 = [];
    int k = 0;
    teachers2.add(Teacher(k++,[0, 3, 4]));
    teachers2.add(Teacher(k++,[2, 4]));
    teachers2.add(Teacher(k++,[2, 2, 4, 4]));
    teachers2.add(Teacher(k++,[1, 3]));
    teachers2.add(Teacher(k++,[3]));
    teachers2.add(Teacher(k++,[]));
    teachers2.add(Teacher(k++,[]));
    teachers2.add(Teacher(k++,[2]));
    teachers2.add(Teacher(k++,[0]));
    teachers2.add(Teacher(k++,[]));

    final List<Period> periods = scheduler.schedule(teachers2, ps);

    test('First Test', () {
      print(teachers2);
      print(periods);
      expect(periods.length, (e) => e == ps);
    });
  });
}

class Period {
  final int _id;

  List<int> teachers;

  Period(int id)
      : _id = id,
        teachers = [] {
    teachers.sort();
  }

  @override
  String toString() {
    return '\n{P_${_id}_: $teachers}';
  }
}

class Teacher {
  final int _id;
  final List<int> _avl;

  Teacher(int id, List<int> avl)
      : _id = id,
        _avl = avl {
    _avl.sort();
  }

  List<int> get avl => _avl;

  bool isAvailable(int at) {
    return _avl.contains(at);
  }

  @override
  String toString() {
    return '\n{T_${_id}_: $_avl}';
  }
}

class Scheduler {
  List<Period> schedule(List<Teacher> teachers, int noOfPeriods) {
    List<Period> periods = [];

    for (int i = 0; i < noOfPeriods; ++i) {
      Period temp = Period(i);

      for (Teacher t in teachers) {
        if (t.isAvailable(i)) {
          temp.teachers.add(t._id);
        }
      }

      periods.add(temp);
    }

    return periods;
  }
}

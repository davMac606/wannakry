import 'package:wannakry/chores.dart';

class ChoresRepository {
  static List<Chore> chores = [];
  
  void addChores(Chore chore) {
    chores.add(chore);
  }

  static List<Chore> getChores() {
    return chores;
  }
  void removeChores() {
    chores.clear();
  }
}
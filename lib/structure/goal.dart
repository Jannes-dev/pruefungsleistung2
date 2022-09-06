
enum Goal{
  stretch, relax, strength, stamina, fun, coreStability;
}
extension GoalExtension on Goal {
  String get value {
    switch (this) {
      case Goal.stretch:
        return "stretch";
      case Goal.relax:
        return "relax";
      case Goal.strength:
        return "strength";
      case Goal.stamina:
        return "stamina";
      case Goal.fun:
        return "fun";
      case Goal.coreStability:
        return "core stability";
      default:
        return "";
    }
  }
}
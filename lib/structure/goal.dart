
import 'package:get/get.dart';

enum Goal{
  stretch, relax, strength, stamina, fun, coreStability;
}
extension GoalExtension on Goal {
  String get value {
    switch (this) {
      case Goal.stretch:
        return "stretch".tr;
      case Goal.relax:
        return "relax".tr;
      case Goal.strength:
        return "strength".tr;
      case Goal.stamina:
        return "stamina".tr;
      case Goal.fun:
        return "fun".tr;
      case Goal.coreStability:
        return "core stability".tr;
      default:
        return "";
    }
  }
}
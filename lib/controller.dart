import 'package:mobx/mobx.dart';
import 'package:mobx_teste/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateEmail() == null && validateName() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatorio";
    } else if (client.name.length < 3) {
      return "Seu nome precisa ter mais que 3 caracteres";
    }
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatorio";
    } else if (!client.email.contains("@")) {
      return "Este email n é valido";
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_teste/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<Controller>(context);
    final controller = GetIt.I.get<Controller>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateName,
                  labelText: "name",
                  onChanged: controller.client.changeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Observer(
            builder: (_) {
              return _textField(
                  errorText: controller.validateEmail,
                  labelText: "email",
                  onChanged: controller.client.changeEmail);
            },
          ),
          SizedBox(
            height: 50,
          ),
          Observer(builder: (_) {
            return RaisedButton(
              onPressed: controller.isValid ? () {} : null,
              child: Text("Salvar"),
            );
          }),
        ],
      ),
    );
  }
}

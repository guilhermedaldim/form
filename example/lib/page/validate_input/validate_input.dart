import 'package:flutter/material.dart';
import 'package:form/form.dart';

class ValidateInputPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Validate input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Input(
                "email",
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validators: [Validators.email],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Enter"),
                      onPressed: () {
                        if (Input.get("email").validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                Input.get("email").text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

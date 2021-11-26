import 'package:app/handlers/hub_handler.dart';
import 'package:app/models/hub.dart';
import 'package:app/screens/hub_list_screen.dart';
import 'package:app/utils/screen_pusher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HubAddScreen extends StatefulWidget {
  const HubAddScreen({Key? key}) : super(key: key);

  @override
  State<HubAddScreen> createState() => _HubAddScreenState();
}

class _HubAddScreenState extends State<HubAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController =
      TextEditingController(text: "Hub");
  final TextEditingController _ipController =
      TextEditingController(text: "localhost:3000");

  void addHub() {
    if (_formKey.currentState!.validate()) {
      // The form is valid, so values are entered.
      HubHandler.addHub(
        Hub(title: _titleController.text, ip: _ipController.text),
      );
      Navigator.pop(context);
      ScreenPusher.pushScreen(context, const HubListScreen());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: On exit of this screen override it and reload the hubs
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => {
            // TODO: Dont go back but reset.
          },
        ),
        title: const Text(
          "Add Hub",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  } else {
                    return null;
                  }
                },
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter IP address';
                  } else {
                    return null;
                  }
                },
                controller: _ipController,
                decoration: const InputDecoration(
                  labelText: "IP Address",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () => addHub(),
      ),
    );
  }
}

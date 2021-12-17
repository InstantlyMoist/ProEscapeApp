import 'package:app/handlers/http_handler.dart';
import 'package:app/models/hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRoomDialog extends StatefulWidget {
  final Hub hub;

  const AddRoomDialog({Key? key, required this.hub}) : super(key: key);

  @override
  State<AddRoomDialog> createState() => _AddRoomDialogState();
}

class _AddRoomDialogState extends State<AddRoomDialog> {
  final TextEditingController _titleController =
      TextEditingController(text: "Een nieuwe kamer");

  void _addRoom() async {
    //todo do this
    await HTTPHandler.addRoom(widget.hub.ip, _titleController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AlertDialog(
          title: const Text("Add room"),
          content: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    child: const Text("Cancel"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _addRoom,
                    child: const Text("Toevoegen"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

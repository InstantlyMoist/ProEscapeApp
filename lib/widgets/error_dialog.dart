import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Verbinden mislukt, probeer het later opnieuw"),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Sluiten"),
            ),
          ],
        ),
      ),
    );
  }
}

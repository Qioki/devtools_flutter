import 'package:flutter/material.dart';

Future<bool?> confirmChange(BuildContext context) async {
  return showModalBottomSheet<bool>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Are you sure?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('Yes'),
                    onPressed: () => Navigator.pop<bool>(context, true),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop<bool>(context, false),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

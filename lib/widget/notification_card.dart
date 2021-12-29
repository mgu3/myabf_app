import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      required this.color,
      required this.callback,
      required this.onDelete})
      : super(key: key);

  final Color color;
  final VoidCallback callback, onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.alarm_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "Today - 10 am",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Gold Coast Open Teams Round 5",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

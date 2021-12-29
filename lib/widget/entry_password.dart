import 'package:flutter/material.dart';
import 'package:myabf/utils/const.dart';

class EntryPassword extends StatefulWidget {
  const EntryPassword({Key? key, this.hint, required this.controller})
      : super(key: key);

  final String? hint;
  final TextEditingController controller;

  @override
  _EntryPasswordState createState() => _EntryPasswordState();
}

class _EntryPasswordState extends State<EntryPassword> {
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: COLOR.AUTH_BACK,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.lock_outline,
            color: COLOR.AUTH_HINT,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: !showPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint ?? "",
                hintStyle: const TextStyle(
                  fontSize: 11,
                  color: COLOR.AUTH_HINT,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            child: const Icon(
              Icons.remove_red_eye_outlined,
              color: COLOR.AUTH_HINT,
            ),
          ),
        ],
      ),
    );
  }
}

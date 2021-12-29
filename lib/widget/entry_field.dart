import 'package:flutter/material.dart';
import 'package:myabf/utils/const.dart';

class EntryField extends StatelessWidget {
  const EntryField(
      {Key? key,
      required this.icon,
      this.hint,
      this.enabled,
      this.keyboardType,
      this.textCapitalization,
      required this.controller})
      : super(key: key);

  final IconData icon;
  final String? hint;
  final TextEditingController controller;
  final bool? enabled; //Birthday - showDialog
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

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
          Icon(
            icon,
            color: COLOR.AUTH_HINT,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              enabled: (enabled ?? true),
              controller: controller,
              keyboardType: keyboardType ?? TextInputType.emailAddress,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint ?? "",
                hintStyle: const TextStyle(
                  fontSize: 11,
                  color: COLOR.AUTH_HINT,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

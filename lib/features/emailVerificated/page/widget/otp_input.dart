import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_pair/features/profile/pages/widgets/text_style_user_info.dart';

class OtpInput extends StatefulWidget {
  final int lenght;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;

  const OtpInput({
    super.key,
    this.lenght = 6,
    this.onChanged,
    this.onCompleted,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNode;

  @override
  void initState() {
    _controllers = List.generate(widget.lenght, (_) => TextEditingController());
    _focusNode = List.generate(widget.lenght, (_) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    for (var contr in _controllers) {
      contr.dispose();
    }
    for (var focus in _focusNode) {
      focus.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.lenght - 1) {
      _focusNode[index + 1].requestFocus();
    }

    final code = _controllers.map((contr) => contr.text).join();
    if (code.length == widget.lenght) {
      widget.onCompleted?.call(code);
    }

    widget.onChanged?.call(code);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.lenght, (index) {
        return SizedBox(
          width: 46,
          height: 59,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNode[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLines: 1,
            style: TextStyleUserInfo().userInfoText(22),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Color(0xFF1b1e25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Color(0xFF2e323c), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Color(0xFFff6b6b), width: 1.5),
              ),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => _onChanged(index, value),
          ),
        );
      }),
    );
  }
}

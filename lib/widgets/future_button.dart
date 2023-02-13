import 'package:flutter/material.dart';

class FutureButton extends StatefulWidget {
  final String title;
  final Future<dynamic> Function() onPressed;

  const FutureButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FutureButtonState();
  }
}

class _FutureButtonState extends State<FutureButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading
          ? null
          : () async {
              setState(() {
                loading = true;
              });

              await widget.onPressed();

              setState(() {
                loading = false;
              });
            },
      height: 48,
      minWidth: double.infinity,
      color: Colors.blue,
      child: Text(widget.title),
    );
  }
}

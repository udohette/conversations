import 'package:conversations/resources/app_color.dart';
import 'package:conversations/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_value_resource.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  const TextFieldWidget({Key? key, required this.label, required this.text, required this.onChanged,  this.maxLines = 1}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
   controller = TextEditingController(text: widget.text);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: getBoldTextStyle(fontSize: AppSize.s16, color: AppColor.balck),),
        SizedBox(height: AppSize.s8,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSize.s12))
          ),
          maxLines: widget.maxLines,
          controller: controller,
        ),
      ],
    );
  }
}

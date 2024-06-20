import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTIme;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({required this.label, required this.isTIme, Key? key, required this.onSaved, required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTIme ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            cursorColor: Colors.grey,
            maxLines: isTIme ? 1 : null,
            expands: !isTIme,
            keyboardType:
                isTIme ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTIme
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixText: isTIme ? '시' : null,
            ),
            // 시간 관련 텍스트 필드는 기본 숫자 키보드 아니면 일반 글자 보여주기
          ),
        ),
        TextFormField(), // 폼 안에서 텍스트 필드를 쓸 때 사용
      ],
    );
  }
}

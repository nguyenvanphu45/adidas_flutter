import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bạn có thắc mắc?'.toUpperCase(),
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
          ),
        ),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                    Icons.question_answer_outlined,
                  size: 30,
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 170,
                  child: Text(
                    'Facebook. Sử dụng tùy chọn tin nhắn riêng để '
                        'liên hệ với nhóm hỗ trợ của chúng tôi',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
            SizedBox(width: 25,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.question_mark,
                  size: 30,
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 170,
                  child: Text(
                    'Hãy đến mục trợ giúp',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( width: 2, color: Colors.black),
                ),
              ),
              child: Text(
                'Gửi tin nhắn.'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                ),
              ),
            ),
            SizedBox(width: 107,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( width: 2, color: Colors.black),
                    ),
                  ),
                  child: Text(
                    'Câu hỏi thường gặp &'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( width: 2, color: Colors.black),
                    ),
                  ),
                  child: Text(
                    'trợ giúp'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.3
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

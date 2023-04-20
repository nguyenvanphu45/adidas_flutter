import 'package:adidas_app/Components/buttonLabel.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonLabel(
              text: 'Thông tin cá nhân',
              subText: '',
              icon: Icons.arrow_forward_ios_rounded,
              onPressed: () {},
          ),
          SizedBox(height: 20,),
          ButtonLabel(
            text: 'Sổ địa chỉ',
            subText: '',
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {},
          ),
          SizedBox(height: 20,),
          Container(
            child: Column(
              children: [
                Text(
                    'Hãy bắt đầu'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5
                  ),
                ),
                Container(
                  child: Column(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          ButtonLabel(
            text: 'Cộng đồng',
            subText: 'Gia nhập các cộng đồng adidas trong khu vực của bạn',
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {},
          ),
          SizedBox(height: 20,),
          ButtonLabel(
            text: 'Sự kiện của tôi',
            subText: 'Xem các sự kiện sắp tới của bạn',
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {},
          ),
          SizedBox(height: 20,),
          ButtonLabel(
            text: 'Voucher',
            subText: 'Xem tất cả voucher',
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {},
          ),
          SizedBox(height: 20,),
          ButtonLabel(
            text: 'Hoạt động tích điểm',
            subText: 'Xem lịch sử tích điểm của tôi',
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

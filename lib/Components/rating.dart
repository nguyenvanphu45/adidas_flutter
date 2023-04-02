import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Xếp hạng & đánh giá'.toUpperCase(),
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3
          ),
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4, 4',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star)
                    ]
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide( width: 1, color: Colors.black),
                    ),
                  ),
                  child: Text(
                      '35 đánh giá',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            ),
            SizedBox(width: 70,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '89 %',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3,
                      fontStyle: FontStyle.italic
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'Khách hàng đề xuất sản phẩm này',
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.clip,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kích thước'.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3
                ),
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    height: 10,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Positioned(
                    top: 1.5,
                    left: 130,
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide( width: 7, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quá nhỏ'),
                  Text('Tuyệt vời'),
                  Text('Quá lớn')
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chiều dài'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                ),
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    height: 10,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Positioned(
                    top: 1.5,
                    left: 130,
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide( width: 7, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quá nhỏ'),
                  Text('Tuyệt vời'),
                  Text('Quá lớn')
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thoải mái'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                ),
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    height: 10,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Positioned(
                    top: 1.5,
                    child: Container(
                      width: 290,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide( width: 7, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Không thoải mái'),
                  Text('Thoải mái'),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chất lượng'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3
                ),
              ),
              SizedBox(height: 5,),
              Stack(
                children: [
                  Container(
                    height: 10,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Positioned(
                    top: 1.5,
                    child: Container(
                      width: 310,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide( width: 7, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Xấu'),
                  Text('Hoàn hảo'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

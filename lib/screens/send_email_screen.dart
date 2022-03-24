import 'package:flutter/material.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (context) =>  const SendEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Gửi email góp ý",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.green,
          actions: const[

            Icon(Icons.alternate_email),
            SizedBox(width: 20,),
            Icon(Icons.send),
          ],
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Row(
            children: [
              const Text("Từ: ",style: TextStyle(fontSize: 18),),

              Container(

                width: MediaQuery.of(context).size.width-40,
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "",
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Đến: ",style: TextStyle(fontSize: 18),),

              Container(

                width: MediaQuery.of(context).size.width-50,
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập email người nhận",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width-20,
            height: 200,
            child: const TextField(
              maxLines: 9,
              decoration: InputDecoration(
                hintText: "Nội dung",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

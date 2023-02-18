import 'package:flutter/material.dart';
class HomeWidget extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  HomeWidget(this.title,this.imageUrl,this.description);
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(3),
        child: Row(
          children:[
            Container(
              height: 140,
              width: 100,
              child: Image.network(widget.imageUrl!,
              fit: BoxFit.fitWidth,
              ),
            ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(widget.title!),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text(widget.description),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';

class PodcastOptions extends StatefulWidget {
  bool isSubscribed;
  Function onSubscribe;
  Function onUnsubscribe;

  PodcastOptions({
    Key key,
    this.isSubscribed,
    this.onSubscribe,
    this.onUnsubscribe
  }) : super(key: key);

  @override
  PodcastOptionsState createState() => PodcastOptionsState();
}

class PodcastOptionsState extends State<PodcastOptions> {
  bool isSubscribed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: Icon(isSubscribed ?? widget.isSubscribed ? Icons.done : Icons.add),
            iconSize: 24.0,
            onPressed: () async {
              bool willBeSubscribed = !(isSubscribed ?? widget.isSubscribed);
              if(willBeSubscribed) {
                await widget.onSubscribe();
              }
              else {
                await widget.onUnsubscribe();
              }

              setState(() {
                isSubscribed = willBeSubscribed;
              });
            }
          ),
        ),
        //Container(
          //child: IconButton(
            //icon: Icon(Icons.share),
            //iconSize: 24.0,
          //),
        //),
      ],
    );
  }
}
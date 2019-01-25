import 'package:community/model/story.dart';
import 'package:community/ui/screens/chat.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {

  final Story story;

  StoryCard({
    @required this.story,
  });

  @override
  Widget build(BuildContext context) {

    Padding _buildTitleSection() {
      return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          // Default value for crossAxisAlignment is CrossAxisAlignment.center.
          // We want to align title and description of recipes left:
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              story.heading,
            ),
            // Empty space:
          ],
        ),
      );
    }

   return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(storyId: story.id,)
          )
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: Image.network(
                      story.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ]
              ),
              _buildTitleSection(),
            ]
          )
        )
      )
   );
  }
}
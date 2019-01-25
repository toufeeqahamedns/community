import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/model/story.dart';
import 'package:community/ui/widgets/stories_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        Firestore.instance.collection('stories');

    Stream<QuerySnapshot> stream = collectionReference.snapshots();

    return Column(
      children: <Widget>[
        Expanded(
          child: new StreamBuilder(
            stream: stream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return _buildLoadingIndicator();
              return new ListView(
                children: snapshot.data.documents.map((document) {
                  return new StoryCard(
                    story: Story.fromMap(document.data, document.documentID),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

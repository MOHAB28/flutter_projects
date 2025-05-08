import 'package:flutter/material.dart';

import 'package:yummy/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme.apply(
      displayColor: Theme.of(context).colorScheme.onSurface, //
    );
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)), //
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(post.profileImageUrl),
        ),
        title: Text(
          post.comment, //
          style: textTheme.titleMedium,
        ),
        subtitle: Text(
          '${post.timestamp} Minutes ago',
          style: textTheme.bodySmall, //
        ),
      ),
    );
  }
}

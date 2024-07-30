import 'package:flutter/material.dart';
import '../../data/models/comments_model.dart';
import '../../data/services/remote_config_service.dart';

class CommentCard extends StatelessWidget {
  final Post post;
  final RemoteConfigService remoteConfigService;

  const CommentCard({Key? key, required this.post, required this.remoteConfigService}) : super(key: key);

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    if (name.length <= 3) return email;
    return '${name.substring(0, 3)}****@${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final email = remoteConfigService.shouldMaskEmail ? _maskEmail(post.email) : post.email;

    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.grey[200],
              child: Text(
                post.name[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${post.name}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Email: $email',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      post.body,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
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
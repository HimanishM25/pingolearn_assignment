import 'package:flutter/material.dart';
import 'package:pingolearn/data/models/comments_model.dart';
import 'package:pingolearn/data/services/api_service.dart';
import 'package:pingolearn/data/services/auth_service.dart';
import 'package:pingolearn/presentation/login.dart';
import 'package:pingolearn/presentation/widgets/comment_card.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import '../data/services/remote_config_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Post>> _futurePosts;
  late RemoteConfigService _remoteConfigService;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiService().fetchComments();
    _remoteConfigService = RemoteConfigService(FirebaseRemoteConfig.instance);
    _remoteConfigService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut().then((_) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SigninScreen()));
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CommentCard(post: snapshot.data![index], remoteConfigService: _remoteConfigService);
              },
            );
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider extends ChangeNotifier {
  late VideoPlayerController _controller;

  VideoPlayerProvider() {
    _controller = VideoPlayerController.network(
      'https://vod-progressive.akamaized.net/exp=1706718759~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4412%2F15%2F397061708%2F1689925131.mp4~hmac=5340a7932690105c20aa6cb6555357c4297b0106e88bbf429539d3dd59df3387/vimeo-prod-skyfire-std-us/01/4412/15/397061708/1689925131.mp4',
    )..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized
      _controller.setLooping(true);
      _controller.play();
      notifyListeners();
    }).catchError((error) {
      print('Error initializing video player: $error');
    });
  }

  VideoPlayerController get controller => _controller;

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

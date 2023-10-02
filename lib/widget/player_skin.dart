import "dart:async";

import "package:fijkplayer/fijkplayer.dart";
import "package:flutter/material.dart";

class PlayerSkin extends StatefulWidget {
  final FijkPlayer player;
  final BuildContext buildCtx;
  final Size viewSize;
  final Rect texturePos;
  const PlayerSkin({
    super.key,
    required this.player,
    required this.buildCtx,
    required this.viewSize,
    required this.texturePos,
  });

  @override
  State<StatefulWidget> createState() => _PlayerSkinState();
}

class _PlayerSkinState extends State<PlayerSkin> {
  bool _playing = false;
  double sliderValue = 0.0;
  double maxDurations = 0.0;
  String durrentPos = "00:00:00";
  String duration = "00:00:00";

  late StreamSubscription _currentPosSubs;

  @override
  void initState() {
    super.initState();

    widget.player.addListener(_playerValueChanged);
    _currentPosSubs = widget.player.onCurrentPosUpdate.listen((v) {
      setState(() {
        sliderValue = v.inMilliseconds.toDouble();
        durrentPos = v.toString().substring(0, v.toString().indexOf("."));
      });
    });
  }

  void _playerValueChanged() {
    FijkValue value = widget.player.value;
    maxDurations = value.duration.inMilliseconds.toDouble();
    duration = value.duration
        .toString()
        .substring(0, value.duration.toString().indexOf("."));

    /// 播放状态
    bool playing = (value.state == FijkState.started);
    if (playing != _playing) setState(() => _playing = playing);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(150),
                Colors.black.withAlpha(100),
                Colors.black.withAlpha(50),
                Colors.black.withAlpha(0),
              ],
            ),
          ),
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.player.pause();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withAlpha(200),
                Colors.black.withAlpha(100),
                Colors.black.withAlpha(50),
                Colors.black.withAlpha(0),
              ],
            ),
          ),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    _playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      _playing ? widget.player.pause() : widget.player.start(),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      //已拖动的颜色
                      activeTrackColor: Colors.greenAccent,
                      //未拖动的颜色
                      inactiveTrackColor: Colors.green,
                      //提示进度的气泡的背景色
                      valueIndicatorColor: Colors.green,
                      //提示进度的气泡文本的颜色
                      valueIndicatorTextStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      //滑块中心的颜色
                      thumbColor: Colors.green,
                      //滑块边缘的颜色
                      overlayColor: Colors.white,
                      //对进度线分割后，断续线中间间隔的颜色
                      inactiveTickMarkColor: Colors.white,
                    ),
                    child: Slider(
                      value: sliderValue,
                      min: 0.0,
                      max: maxDurations,
                      onChanged: (val) {
                        setState(() => sliderValue = val.floorToDouble());
                        widget.player.seekTo(sliderValue.toInt());
//                            print(sliderValue);
                      },
                    ),
                  ),
                ),
                Text(
                  "$durrentPos / $duration",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.open_in_full_sharp,
                      color: Colors.white,
                      size: 18,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.player.removeListener(_playerValueChanged);
    _currentPosSubs.cancel();
    super.dispose();
  }
}

import "dart:async";
import "dart:math";

import "package:fijkplayer/fijkplayer.dart";
import "package:flutter/material.dart";

class CustomFijkPanel extends StatefulWidget {
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;

  const CustomFijkPanel({
    super.key,
    required this.player,
    required this.buildContext,
    required this.viewSize,
    required this.texturePos,
  });

  @override
  State<StatefulWidget> createState() => _CustomFijkWidgetBottomState();
}

class _CustomFijkWidgetBottomState extends State<CustomFijkPanel> {
  FijkPlayer get player => widget.player;

  /// 播放状态
  bool _playing = false;

  /// 是否显示状态栏+菜单栏
  bool isPlayShowCont = true;

  /// 总时长
  String duration = "00:00:00";

  /// 已播放时长
  String durrentPos = "00:00:00";

  /// 进度条总长度
  double maxDurations = 0.0;

  /// 流监听器
  late StreamSubscription _currentPosSubs;

  /// 定时器
  late Timer _timer;

  /// 进度条当前进度
  double sliderValue = 0.0;

  @override
  void initState() {
    /// 提前加载
    /// 进行监听
    widget.player.addListener(_playerValueChanged);

    /// 接收流
    _currentPosSubs = widget.player.onCurrentPosUpdate.listen((v) {
      setState(() {
        /// 实时获取当前播放进度（进度条）
        sliderValue = v.inMilliseconds.toDouble();

        /// 实时获取当前播放进度（数字展示）
        durrentPos = v.toString().substring(0, v.toString().indexOf("."));
      });
    });

    /// 初始化
    super.initState();
  }

  /// 监听器
  void _playerValueChanged() {
    FijkValue value = player.value;

    /// 获取进度条总时长
    maxDurations = value.duration.inMilliseconds.toDouble();

    /// 获取展示的时长
    duration = value.duration
        .toString()
        .substring(0, value.duration.toString().indexOf("."));

    /// 播放状态
    bool playing = (value.state == FijkState.started);
    if (playing != _playing) setState(() => _playing = playing);
  }

  @override
  Widget build(BuildContext context) {
    Rect rect = Rect.fromLTRB(
      max(0.0, widget.texturePos.left),
      max(0.0, widget.texturePos.top),
      min(widget.viewSize.width, widget.texturePos.right),
      min(widget.viewSize.height, widget.texturePos.bottom),
    );

    return Positioned.fromRect(
      rect: rect,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // 显示 、隐藏  进度条+标题栏
            isPlayShowCont = !isPlayShowCont;

            // 如果显示了  , 3秒后 隐藏进度条+标题栏
            if (isPlayShowCont)
              _timer = Timer(
                  const Duration(seconds: 3), () => isPlayShowCont = false);
          });
        },
        child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.0),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 标题栏
                !isPlayShowCont
                    ? const SizedBox()
                    : Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.65),
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      ),

                /// 控制条
                !isPlayShowCont
                    ? const SizedBox()
                    : Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.65),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                _playing ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: () => _playing
                                  ? widget.player.pause()
                                  : widget.player.start(),
                            ),

                            /// 进度条 使用Slider滑动组件实现
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
                                  value: this.sliderValue,
                                  label:
                                      '${int.parse((this.sliderValue / 3600000).toStringAsFixed(0)) < 10 ? '0' + (this.sliderValue / 3600000).toStringAsFixed(0) : (this.sliderValue / 3600000).toStringAsFixed(0)}:${int.parse(((this.sliderValue % 3600000) / 60000).toStringAsFixed(0)) < 10 ? '0' + ((this.sliderValue % 3600000) / 60000).toStringAsFixed(0) : ((this.sliderValue % 3600000) / 60000).toStringAsFixed(0)}:${int.parse(((this.sliderValue % 60000) / 1000).toStringAsFixed(0)) < 10 ? '0' + ((this.sliderValue % 60000) / 1000).toStringAsFixed(0) : ((this.sliderValue % 60000) / 1000).toStringAsFixed(0)}',
                                  min: 0.0,
                                  max: maxDurations,
                                  divisions: 1000,
                                  onChanged: (val) {
                                    ///转化成double
                                    setState(() =>
                                        this.sliderValue = val.floorToDouble());

                                    /// 设置进度
                                    player.seekTo(this.sliderValue.toInt());
//                            print(this.sliderValue);
                                  },
                                ),
                              ),
                            ),
                            Text(
                              "${durrentPos} / ${duration}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    /// 关闭监听
    player.removeListener(_playerValueChanged);

    /// 关闭流回调
    _currentPosSubs?.cancel();
    super.dispose();
  }
}

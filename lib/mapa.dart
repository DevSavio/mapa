import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:mapa/player.dart';

class Mapa extends StatelessWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double tileSize = max(constraints.maxHeight, constraints.maxWidth) / 20;

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BonfireTiledWidget(
            background: BackgroundColorGame(Colors.green[200]!),
            joystick: Joystick(
              keyboardConfig: KeyboardConfig(),
              directional: JoystickDirectional(),
            ),
            map: TiledWorldMap(
              'mapa1.json',
              forceTileSize: Size(tileSize, tileSize),
            ),
            overlayBuilderMap: {
              'miniMap': (context, game) => MiniMap(
                    game: game,
                    margin: EdgeInsets.all(20),
                    borderRadius: BorderRadius.circular(10),
                    size: Vector2.all(
                      min(constraints.maxHeight, constraints.maxWidth) / 3,
                    ),
                    border: Border.all(color: Colors.white.withOpacity(0.5)),
                  ),
            },
            player: MyPlayer(
              Vector2((8 * tileSize), (5 * tileSize)),
            ),
            initialActiveOverlays: [
              'miniMap',
            ],
            cameraConfig: CameraConfig(
              smoothCameraEnabled: true,
              smoothCameraSpeed: 2,
            ),
          ),
        ),
      );
    });
  }
}

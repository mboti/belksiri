import 'dart:math';

import 'package:belksiri/ex/bluetooth.dart';
import 'package:belksiri/ex/bluetoothle.dart';
import 'package:belksiri/ex/com_demo.dart';
import 'package:belksiri/ex/commdlg.dart';
import 'package:belksiri/ex/dialogbox.dart';
import 'package:belksiri/ex/dialogshow.dart';
import 'package:belksiri/ex/diskinfo.dart';
import 'package:belksiri/ex/dynamic_load.dart';
import 'package:belksiri/ex/filever.dart';
import 'package:belksiri/ex/fonts.dart';
import 'package:belksiri/ex/gamepad.dart';
import 'package:belksiri/ex/guid.dart';
import 'package:belksiri/ex/hello.dart';
import 'package:belksiri/ex/hooks.dart';
import 'package:belksiri/ex/idispatch.dart';
import 'package:belksiri/ex/knownfolder.dart';
import 'package:belksiri/ex/midi.dart';
import 'package:belksiri/ex/modules.dart';
import 'package:belksiri/ex/monitor.dart';
import 'package:belksiri/ex/msgbox.dart';
import 'package:belksiri/ex/network.dart';
import 'package:belksiri/ex/paint.dart';
import 'package:belksiri/ex/pipe.dart';
import 'package:belksiri/ex/play_sound.dart';
import 'package:belksiri/ex/process.dart';
import 'package:belksiri/ex/registry.dart';
import 'package:belksiri/ex/appcontainer.dart';
import 'package:belksiri/ex/my_script.dart';
import 'package:belksiri/ex/screenshot.dart';
import 'package:belksiri/ex/scroll.dart';
import 'package:belksiri/ex/serial.dart';
import 'package:belksiri/ex/setup_api.dart';
import 'package:belksiri/ex/shortcut.dart';
import 'package:belksiri/ex/speech.dart';
import 'package:belksiri/ex/sysinfo.dart';
import 'package:belksiri/ex/taskdialog.dart';
import 'package:belksiri/ex/vt.dart';
import 'package:belksiri/ex/wallpaper.dart';
import 'package:belksiri/ex/wasapi.dart';
import 'package:belksiri/ex/wmi_perf.dart';
import 'package:belksiri/ex/wmi_wql.dart';
import 'package:belksiri/ex/wsl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_gui/flutter_auto_gui.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Auto GUI'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Mouse API'),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  Point<int>? p =
                                  await FlutterAutoGUI.position();
                                  controller.text =
                                  'Mouse Position = ${p.toString()}';
                                },
                                child: const Text('Mouse Position'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await FlutterAutoGUI.moveTo(
                                    point: const Point(10, 10),
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: const Text('Move to 10, 10'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await FlutterAutoGUI.moveToRel(
                                    offset: const Size(100, -100),
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: const Text('Move to rel 100, -100'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.dragTo(
                                    point: const Point(100, 100),
                                    button: MouseButton.left,
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: const Text('Drag to 100, 100'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.dragToRel(
                                    offset: const Size(200, 300),
                                    button: MouseButton.left,
                                    duration: const Duration(seconds: 1),
                                  );
                                },
                                child: const Text('Drag to rel 100, 0'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.mouseDown(
                                    button: MouseButton.left,
                                  );
                                },
                                child: const Text('Set Left Button Down'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.mouseDown(
                                    button: MouseButton.left,
                                  );
                                },
                                child: const Text('Set Left Button Up'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.click(
                                    button: MouseButton.left,
                                    clicks: 1,
                                  );
                                },
                                child: const Text('Single click left button'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.click(
                                    button: MouseButton.left,
                                    clicks: 2,
                                  );
                                },
                                child: const Text('Double click left button'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.scroll(
                                    axis: Axis.vertical,
                                    clicks: 5,
                                  );
                                },
                                child: const Text(
                                    'Vertical Scroll up for 5 clicks'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  await FlutterAutoGUI.scroll(
                                    axis: Axis.horizontal,
                                    clicks: 5,
                                  );
                                },
                                child: const Text(
                                    'Horizontal Scroll right for 5 clicks'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Keyboard API'),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [


                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  FlutterAutoGUI.keyDown(key: 'w');
                                },
                                child: const Text('W key down'),
                              ),



                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  FlutterAutoGUI.keyUp(key: 'w');
                                },
                                child: const Text('W key up'),
                              ),



                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  FlutterAutoGUI.press(
                                    key: 'w',
                                    times: 2,
                                    interval: const Duration(
                                      seconds: 2,
                                    ),
                                  );
                                },
                                child: const Text(
                                    'Press W key up 2 time over 2 seconds'),
                              ),



                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  FlutterAutoGUI.write(
                                    text: 'hellO wOrld!',
                                    interval: const Duration(
                                      milliseconds: 50,
                                    ),
                                  );
                                },
                                child: const Text('Writes \'hellO wOrld!\''),
                              ),



                              ElevatedButton(
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  FlutterAutoGUI.hotkey(
                                    keys: ['ctrl', 'shift', 'esc'],
                                  );
                                },
                                child: const Text(
                                    'Hotkey (control + shift + escape)'),
                              ),


                              ElevatedButton(
                                onPressed: () async {
                                  MyScript script = MyScript();
                                  script.sendInput();
                                },
                                child: const Text('sendInput'),
                              ),


                              ElevatedButton(
                                onPressed: () async {
                                  MyScript script = MyScript();
                                  script.subProcess();
                                },
                                child: const Text('subProcess'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  MyScript script = MyScript();
                                  script.findPowerPoint();
                                },
                                child: const Text('PowerPoint'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  MyScript script = MyScript();
                                  script.getActiveWindow();
                                },
                                child: const Text('getActiveWindow'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  RegistryEx script = RegistryEx();
                                  script.launch();
                                },
                                child: const Text('registry'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  AppContainer script = AppContainer();
                                  script.launch();
                                },
                                child: const Text('AppContainer'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  BluetoothEx script = BluetoothEx();
                                  script.launch();
                                },
                                child: const Text('Bluetooth'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  BluetoothleEx script = BluetoothleEx();
                                  script.launch();
                                },
                                child: const Text('Bluetoothle'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ComEx script = ComEx();
                                  script.launch();
                                },
                                child: const Text('Com'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  CommdlgEx script = CommdlgEx();
                                  script.launch();
                                },
                                child: const Text('Commdlg'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  DialogboxEx script = DialogboxEx();
                                  script.launch();
                                },
                                child: const Text('Dialogbox'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  DialogshowEx script = DialogshowEx();
                                  script.launch();
                                },
                                child: const Text('Dialogshow'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  DiskInfoEx script = DiskInfoEx();
                                  script.launch();
                                },
                                child: const Text('DiskInfo'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  DynamicLoadEx script = DynamicLoadEx();
                                  script.launch();
                                },
                                child: const Text('DynamicLoad'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  FileVersionEx script = FileVersionEx();
                                  script.launch();
                                },
                                child: const Text('FileVersion'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  FontsEx script = FontsEx();
                                  script.launch();
                                },
                                child: const Text('Fonts'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  GamePadEx script = GamePadEx();
                                  script.launch();
                                },
                                child: const Text('GamePad'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  GuidEx script = GuidEx();
                                  script.launch();
                                },
                                child: const Text('Guid'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  HelloEx script = HelloEx();
                                  script.launch();
                                },
                                child: const Text('Hello'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  HooksEx script = HooksEx();
                                  script.launch();
                                },
                                child: const Text('Hooks'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  IdispatchEx script = IdispatchEx();
                                  script.launch();
                                },
                                child: const Text('Idispatch'), // attention au clean
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  KnownfolderEx script = KnownfolderEx();
                                  script.launch();
                                },
                                child: const Text('Knownfolder'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  MidiEx script = MidiEx();
                                  script.launch();
                                },
                                child: const Text('Midi'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ModulesEx script = ModulesEx();
                                  script.launch();
                                },
                                child: const Text('Modules'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  MonitorEx script = MonitorEx();
                                  script.launch();
                                },
                                child: const Text('Monitor'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  MsgBoxEx script = MsgBoxEx();
                                  script.launch();
                                },
                                child: const Text('MsgBox'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  NetworkEx script = NetworkEx();
                                  script.launch();
                                },
                                child: const Text('Network'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  PaintEx script = PaintEx();
                                  script.launch();
                                },
                                child: const Text('Paint'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  List<String> list = ["powerpoint", "test"];
                                  PipeEx script = PipeEx();
                                  script.launch(list);
                                },
                                child: const Text('Pipe'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  PlaySoundEx script = PlaySoundEx();
                                  script.launch();
                                },
                                child: const Text('PlaySound'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ProcessEx script = ProcessEx();
                                  script.launch();
                                },
                                child: const Text('Process'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ScreenshotEx script = ScreenshotEx();
                                  script.launch();
                                },
                                child: const Text('Screenshot'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ScrollEx script = ScrollEx();
                                  script.launch();
                                },
                                child: const Text('Scroll'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  SerialEx script = SerialEx();
                                  script.launch();
                                },
                                child: const Text('Serial'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  SetupApiEx script = SetupApiEx(); // ne fonctionne pas à revoir
                                  script.launch();
                                },
                                child: const Text('SetupApi'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  ShortCutEx script = ShortCutEx();
                                  script.launch();
                                },
                                child: const Text('ShortCut'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  SpeechEx script = SpeechEx();
                                  script.launch();
                                },
                                child: const Text('Speech'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  SysinfoEx script = SysinfoEx();
                                  script.launch();
                                },
                                child: const Text('Sysinfo'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  TaskDialogEx script = TaskDialogEx();
                                  script.launch();
                                },
                                child: const Text('TaskDialog'), // à revoir problème avec le fichier manifest
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  VtEx script = VtEx();
                                  script.launch();
                                },
                                child: const Text('VtEx'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  WallpaperEx script = WallpaperEx();
                                  script.launch();
                                },
                                child: const Text('WallpaperEx'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  WasapiEx script = WasapiEx();
                                  script.launch();
                                },
                                child: const Text('Wasapi'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  WmiPerfEx script = WmiPerfEx();
                                  script.launch();
                                },
                                child: const Text('WmiPerfEx'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  WmiWqlEx script = WmiWqlEx(); // fonctionne pas
                                  script.launch();
                                },
                                child: const Text('WmiWqlEx'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  WslEx script = WslEx();
                                  script.launch();
                                },
                                child: const Text('WslEx'),
                              ),

                              ElevatedButton(
                                onPressed: () async {
                                  RegistryEx script = RegistryEx();
                                  script.launch();
                                },
                                child: const Text(''),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Screen API'),
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: const [],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
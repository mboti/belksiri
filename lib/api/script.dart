import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter_auto_gui/flutter_auto_gui.dart';
import 'package:flutter/material.dart';
import 'package:win32/win32.dart';





class MyScript {

  static Map<int, String> mapHWND = {};
  static int  myHWND = -1;

  MyScript();


  //----------------------------------------------------------------------------
  void sendInput(){
    const VK_A = 0x41;
    print('Switching to Notepad and going to sleep for a second.');
    ShellExecute(0, TEXT('open'), TEXT('notepad.exe'), nullptr, nullptr, SW_SHOW);
    Sleep(1000);

    print('Sending the "A" key and the Unicode character "€".');
    //"A"-----------------------------------------------------------------------
    final kbd = calloc<INPUT>();
    kbd.ref.type = INPUT_KEYBOARD;
    kbd.ref.ki.wVk = VK_A;
    var result = SendInput(1, kbd, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    kbd.ref.ki.dwFlags = KEYEVENTF_KEYUP;
    result = SendInput(1, kbd, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    //"€"-----------------------------------------------------------------------
    kbd.ref.ki.wVk = 0;
    kbd.ref.ki.wScan = 0x20AC; // euro sign
    kbd.ref.ki.dwFlags = KEYEVENTF_UNICODE;
    result = SendInput(1, kbd, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    kbd.ref.ki.dwFlags = KEYEVENTF_UNICODE | KEYEVENTF_KEYUP;
    result = SendInput(1, kbd, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    //liberer la mémoire
    free(kbd);

    //right-click---------------------------------------------------------------
    print('Sending a right-click mouse event.');
    final mouse = calloc<INPUT>();
    mouse.ref.type = INPUT_MOUSE;
    mouse.ref.mi.dwFlags = MOUSEEVENTF_RIGHTDOWN;
    result = SendInput(1, mouse, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    Sleep(1000);
    mouse.ref.mi.dwFlags = MOUSEEVENTF_RIGHTUP;
    result = SendInput(1, mouse, sizeOf<INPUT>());
    if (result != TRUE) print('Error: ${GetLastError()}');

    //liberer la mémoire
    free(mouse);
  }





  //----------------------------------------------------------------------------
  /// List the window handle and text for all top-level desktop windows
  /// in the current session.
  void enumerateWindows() {
    final wndProc = Pointer.fromFunction<EnumWindowsProc>(enumWindowsProc, 0);
    EnumWindows(wndProc, 0);
  }

  // Callback for each window found
  static int enumWindowsProc(int hWnd, int lParam) {
    // Don't enumerate windows unless they are marked as WS_VISIBLE
    if (IsWindowVisible(hWnd) == FALSE) return TRUE;

    final length = GetWindowTextLength(hWnd);
    if (length == 0) {
      return TRUE;
    }

    final buffer = wsalloc(length + 1);
    GetWindowText(hWnd, buffer, length + 1);
    String test = (buffer.toDartString()).toLowerCase();
    test = removeDiacritics(test);
    test = test.replaceAll(RegExp(' '), '');
    mapHWND[hWnd] = test;
    print('hWnd $hWnd: ${buffer.toDartString()}');

    free(buffer);
    return TRUE;
  }

  //supprimer les signes diacritiques (accents) d'une chaîne
  static String removeDiacritics(String str) {
    var withDia = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }
    return str;
  }


  /// Find the first open Notepad window and maximize it
  void findNotepad() {
    final hwnd = FindWindowEx(0, 0, TEXT('Notepad'), nullptr);

    if (hwnd == 0) {
      print('No Notepad window found.');
    } else {
      ShowWindow(hwnd, SW_MAXIMIZE);
    }
  }

  void subProcess(){
    enumerateWindows();
    findNotepad();
  }




  //----------------------------------------------------------------------------
  /// Find the first open Notepad window and maximize it
  void putForwardPowerPoint() {
    //final hwnd =FindWindow(nullptr,TEXT('Présentation1 - PowerPoint'));
    //final hwnd =FindWindow(nullptr,TEXT("Outil Capture d’écran"));
    if(HWND==-1){

    }
    int hwnd = 1574346;

    if (hwnd == 0) {
      print('No PowerPoint window found.');
    } else {
      SetForegroundWindow(hwnd);      // mettre fenêtre en avant
      //ShowWindow(hwnd, SW_MAXIMIZE);  // maximiser la fenetre
      print('hwnd PowerPoint : $hwnd');
    }
    //ShowWindow(GetWindowDC(460606), SW_MAXIMIZE);
  }

  void commandPowerPoint(){
    // vider la liste pour ne pas avoir de doublons
    mapHWND.clear();
    enumerateWindows();
    print(mapHWND);
    boucle();
    SetForegroundWindow(myHWND);
    FlutterAutoGUI.hotkey(
      keys: ['f1'],
    );
  }

  boucle(){
    const string = 'Dart strings';
    final containsD = string.contains('D'); // true

    if(mapHWND.isNotEmpty){
      mapHWND.forEach((key, value) {
        print('$key: $value');
        if(value.contains('power')){
          myHWND = key;
        }
      });
    }
  }



  //----------------------------------------------------------------------------
  /// Find the first open Notepad window and maximize it
  void getActiveWindow() {
    final int hwnd =  GetActiveWindow();
    print('ActiveWindow ${hwnd}');
  }

  //----------------------------------------------------------------------------
  // bool RegisterHotKey(
  //     {required int vk, Pointer<Hwnd> hWnd, int id = 1, int fsModifiers = 0}) {
  //   ArgumentError.checkNotNull(vk);
  //   hWnd ??= nullptr;
  //
  //   final RegisterHotKeyP = dylib.lookupFunction<RegisterHotKeyC, RegisterHotKeyDart>('RegisterHotKey');
  //
  //   var result = RegisterHotKeyP(hWnd, id, fsModifiers, vk);
  //   return result != 0;
  // }



  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------


}
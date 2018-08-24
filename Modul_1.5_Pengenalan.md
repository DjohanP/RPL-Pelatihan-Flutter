# Pengenalan FLutter
![Gambar Flutter](https://flutter.io/images/flutter-logo-sharing.png)

Flutter adalah SDK untuk pengembangan aplikasi mobile yang dikembangkan oleh Google.framework ini dapat digunakan untuk membuat atau mengembangkan aplikasi mobile yang dapat berjalan pada device iOS dan Android. Dibuat menggunakan bahasa C, C++, Dart and Skia

## State

![Gambar Flutter](https://cdn-images-1.medium.com/max/1600/1*3WYKeZb9WQU7CiwwhTF5iw.png)
Flutter menggunakan <i>widget</i> untuk merepresentasikan <i>User Interface</i>, terdapat dua macam yaitu <b>stateless</b> dan <b>stateful</b>

### i. Stateless
pada statelessWidget, maka semua properti yang ada didalamnya bersifat mutlak. contoh : <i>ikon</i>, <i> teks</i>
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter', //teks
    );
  }
}
```

### ii. Stateful
pada statefulWidget, maka properti yang ada didalamnya dapat berubah dan dapat di-interaksikan contoh : <i>checkbox</i>, <i> slider</i>, <i> form</i>
<ul>
  <li>untuk mendeklarasikan statefulWidget terdiri dari 2 langkah</li>
  1. subclass <i>StatefulWidget</i> untuk deklarasi widget<br>
  2. subclass <i>State</i> yang berisi state dari widget
</ul>

```dart
class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    // return Widget...
    // new FlatButton(onPressed: 'do something')
    // new FlatButton(onPressed: 'do something else')
  }
}
```

## Asynchronous Programming
Dart is a single-threaded programming language. If any code blocks the thread of execution (for example, by waiting for a time-consuming operation or blocking on I/O) the program effectively freezes. Asynchronous operations let your program run without getting blocked. Dart uses Future objects to represent asynchronous operations.

```dart
// Synchronous code
printDailyNewsDigest() {
  String news = gatherNewsReports(); // proses fungsi
  print(news);
}

main() {
  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}
```

dalam potongan kode diatas, fungsi <i>printWinningLotteryNumbers()</i> hanya berjalan saat <i>gatherNewsReports()</i> telah selesai, maka akan menyebabkan program freeze sambil menunggu <i>gatherNewsReports()</i> telah mereturn sesuatu. maka dari itu dalam .dart digunakan <b><a href="https://api.dartlang.org/stable/2.0.0/dart-async/Future-class.html">future</a></b>

future adalah untuk mendapatkan value sambil program terus berjalan, dan akan kembali saat telah mendapatkan value yang diinginkan, caranya adalah menggunakan <b>async</b> dan <b>await</b>

```dart
import 'dart:async';

printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  print(news);
}

main() {
  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}

const news = '<gathered news goes here>';
```

<i>output</i>
```c
Winning lotto numbers: [23, 63, 87, 26, 2]
Tomorrow's forecast: 70F, sunny.
Baseball score: Red Sox 10, Yankees 0
<gathered news goes here>
```
fungsi <i>printDailyNewsDigest()</i> akan dieksekusi terakhir sampai <i>gatherNewsReports()</i> telah mendapat value yang diinginkan

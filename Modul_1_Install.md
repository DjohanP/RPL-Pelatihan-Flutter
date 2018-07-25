## Instalasie Flutter

 Berikut adalah beberapa hal yang perlu didonlot untuk menginstall **flutter**

>  - Flutter SDK : https://flutter.io/sdk-archive/
>  - Android Studio : https://developer.android.com/studio/

**Step 1**

>  - Ekstrak "flutter_windows_vx.x.x-beta.zip" ke direktori kesayangan mu
>  Contoh : `C:\flutter`
>  - Install Android Studio *(next next aja)*
 
**Step 2**

>  - Buka folder flutter yang kamu extract tadi, terus cari dan buka ***flutter_console.bat*** *(double click aja)*
>  kalo udah kebuka bakal muncul beginian :![Tampilan cmd kalo abis buka flutter_console.bat](https://i.imgur.com/ThElAWE.png)
>  - sekarang coba jalanin `flutter doctor` dan enter
>  akan muncul kayak gini ![setelah jalanin flutter doctor](https://i.imgur.com/LD4LeZw.png)
 flutter doctor akan meriksa komputer kita, apakah sudah tersedia tools untuk mendukung berjalannya flutter. *(seharusnya kalo udah install android studio dan udah melakukan update SDK nya, tampilan punya kalian bakal sama kayak diatas)*

**Step 3**

>  - Buka Android Studio, dan install plugin Flutter nya
	>   : `File -> Settings -> Plugins -> Brose Repositories..`
	terus cari **Flutter** dan install deh
	![install Plugin Flutter](https://i.imgur.com/LuP1tDo.png)
>  - Setelah install wajib di **restart** Android Studionya

**Step 4**

>  - Sekarang kita coba bikin project flutter
	>  `File -> New -> New Flutter Project...`
>  - Pilih **Flutter Application**
>  - Nanti bakal muncul beginian
>  ![Window new flutter Project](https://i.imgur.com/SILw1gT.png)
> Bisa isi terserah kalian, untuk **Flutter SDK path** nya bisa kalian locate di tempat kalian ekstrak ***(Step 1)***
> - Klik next -> finish, tunggu loading nya

**Step 5**

>   Buat jalanin programnya bisa pake emulator atau hp kalian
>  - **Buat yang pake Emulator** : 
> > `Tools -> AVD Manager -> Create Virtual Device...`
>  Pilih devicenya, kemudian pilih API nya, pilih yang terbaru aja *(Android 8.1)*, terserah kasih nama AVD nya, kemudian klik finish.
>  `Developer Options -> USB Debuggin : Enable, Install via USB : Enable`
>  buat lokasi/enable developer option bisa cek di google sesuai merek HP kalian masing masing 
>  *(**Install via USB** , tidak semua HP ada option tersebut, kalo gak ada berarti gapapa gaosah di enable)*
>  
>  - **Buat yang pake HP** : 
>  >`Developer Options -> USB Debuggin : Enable, Install via USB : Enable`
>  buat lokasi/enable developer option bisa cek di google sesuai merek HP kalian masing masing 
>  *(**Install via USB** , tidak semua HP ada option tersebut, kalo gak ada berarti gapapa gaosah di enable)*
>  colokin deh ke laptop pake kabel usb (hp nya nyala ya)

**Step 6**

>  - kalo emulator/hp nya sudah ter-deteksi, bakal muncul nama hp/emulator kalian *(di pojok kanan atas, gak pojok banget si)*
>  ![enter image description here](https://i.imgur.com/de2mJ4w.png)
>  - Pilih device nya, kalo udah silahkan pencet segitiga Ijo

**Modul untuk instalasie sudah selesai :-)**

>  sebetulnya ada cara untuk menggunakan IDE lain selain Android Studio
> (Visual Studio Code, IntelliJ), hanya saja ini cara paling mudah
> untuk awam karena Android Studio sudah sepaket dari SDK sampai
> emulatornya *(tinggal next next)*.

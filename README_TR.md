# JARVIS Android

Bu klasor, Windows `.exe` uygulamasinin Android'de dogrudan calistirilmasi yerine hazirlanmis mobil JARVIS surumudur.

Android `.exe` calistiramaz. Bu nedenle masaustu projedeki `tkinter`, `pyaudio`, Windows uygulama acma, Windows shell ve PyInstaller parcalari Android'e tasinmadi. Yerlerine Android'in kendi konusma tanima, TextToSpeech, tarayici ve takvim Intent ozellikleri kullanildi.

## Ozellikler

- Gemini API ile metin sohbeti
- Android mikrofonu ile Turkce konusma tanima
- Android TextToSpeech ile sesli cevap
- API anahtarini cihazda yerel saklama
- Kalici JARVIS hafizasi
- Google arama, YouTube ve takvim kisayollari
- Daha belirgin JARVIS orb gorseli
- Acilista `Made with Selman ÖZDEMİR` splash ekrani
- `▲ Menu` tusuyla asagidan yukari acilan arac menusu
- Sol altta `@slmno_zdmr` Instagram profil baglantisi
- Android uygulama ikonu kullanicinin verdigi JARVIS TURKIYE gorselinden olusturuldu
- Harici Java/Kotlin kutuphanesi gerektirmeyen sade Android proje yapisi

## Android Studio ile APK alma

1. Android Studio'yu ac.
2. `outputs/JarvisAndroid` klasorunu proje olarak sec.
3. Gradle sync bittikten sonra `Build > Build Bundle(s) / APK(s) > Build APK(s)` sec.
4. APK genellikle `app/build/outputs/apk/debug/app-debug.apk` altinda olusur.

Ilk acilista Gemini API anahtarini gir. Anahtar sadece telefonda `SharedPreferences` icinde tutulur.

## APK paylasma ve kurma

- APK mesaj uygulamasindan direkt acilmazsa once telefona indir/kaydet.
- WhatsApp/Telegram gibi uygulamalarda dosyayi once `Indirilenler` veya `Dosyalar` icine kaydetmek daha sagliklidir.
- Alici telefonda `Bilinmeyen uygulamalari yukle` iznini, APK'yi actigi uygulama icin vermelidir.
- Eski surum yukluyse ve `Uygulama yuklenmedi` hatasi cikarsa once eski JARVIS'i kaldir, sonra yeni APK'yi kur.
- Daha temiz dagitim icin Android Studio'da `Build > Generate Signed Bundle / APK > APK` ile imzali release APK uret.

## Gemini 429 hatasi

`429` hatasi genelde API kotasi veya cok kisa surede fazla istek anlamina gelir. Uygulama artik hafif `gemini-3.5-flash-lite` modelini kullanir, cikis uzunlugunu dusurur ve 429/503 durumunda kisa bekleyip tekrar dener.

Yine de kota bittiyse uygulama bunu tek basina cozemez. Cozumler:

- Biraz bekleyip tekrar dene.
- Google AI Studio'dan yeni/farkli API anahtari gir.
- API anahtarinin kota/billing durumunu Google Cloud Console'dan kontrol et.
- APK'yi baskalarina verirken herkes kendi Gemini API anahtarini girmelidir; senin anahtarin herkes tarafindan kullanilirsa kota cok hizli dolar.
- Uygulamada `api test` yazarsan sadece API baglantisini test eder ve tam hata mesajini gosterir.

## Komut satirindan derleme

Android Studio veya Gradle kuruluysa:

```bat
gradle assembleDebug
```

Gradle yoksa Android Studio projeyi actiginda kendi Gradle dagitimini kullanabilir. Bu bilgisayarda yaptigim kontrolde `gradle` ve Android SDK komutlari PATH uzerinde bulunmadi, bu yuzden burada APK dosyasini fiilen uretemedim.

## Notlar

- Masaustu `Jarvis.exe` aynen Android'e donusturulemez.
- Bu proje Android'de calisacak sekilde yeniden yazilmis mobil kabuktur.
- Kamera/ekran analizi ve WhatsApp otomasyonu icin Android tarafinda ek izinler ve platforma ozel entegrasyon gerekir; mevcut surum temel asistan akisini tamamlar.

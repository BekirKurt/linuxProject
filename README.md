# Linux Shell Script Projesi

Linux bash script dili ile proje geliştirilmiştir. Projenin görsel arayüzü olarak <b>zenity</b> kütüphanesi kullanılmıştır. Linux ve benzeri işletim sistemlerinin en önemli özelliklerinden birisi, <b>her şey bir dosyadır</b> felsefesidir. Bu projede dosya izin işlemleriyle alakalıdır. Uygulamanın temel özellikleri :

<ul>
  <li>Dosya izin işlemleri için bir görsel arayüz </li>
  <li>Dosya içeriklerinin görüntülenmesi ve değiştirilmesi</li>
  <li>Dosya izinlerinin görüntülenmesi</li>
  <li>Diskin yüzdesel olarak doluluk durumu</li>
  <li>History komutunun listelenmesi ve seçilen komutun tekrar çalıştırılması</li>
</ul>
Uygulamanın temel özellikleri yukarıda listelenmiştir. Detaylı  YouTube videosunu için tıklayınız <a href="https://www.youtube.com/?hl=tr&gl=TR">tıklayınız</a>



<h2> Projenin Başlatılması </h2>

* İlk olarak proje için gerekli kurulumlar yapılır.
* `sudo apt-get install zenity` komutu ile  zenity çalışma ortamını dahil edelir. 
* Reponun kaynak dosyaları indirildikten sonra yerel bilgisayarınızda proje dizinine gidilir.
* Çalıştırma yetkisi yok ise `chmod +x project.sh` komutu ile çalıştırma yetkisi verilir.
* Son olarak terminalde `bash project.sh` komutu ile çalıtırılır.

<h2> Proje Hakkında </h2>

* Projenin menüsü aşağıdaki şekildeki gibidir. 

![Ekran Görüntüsü - 2022-12-28 14-31-27](https://user-images.githubusercontent.com/73036927/209805896-41ff7dda-1d41-4feb-a6f6-b976a64f921b.png)

* Projenin ikinci seçeneğine tıklayarak proje klasöründe olan dosyaların aşağıdaki formatta klasör olup olmadığı <b>user</b><b>group</b>ve <b>other</b> kullanıcı dosya izinlerinin yanında dosya boyutu ve değiştirilme tarihi bilgilerini gösterir.

![Ekran Görüntüsü - 2022-12-28 15-03-05](https://user-images.githubusercontent.com/73036927/209809492-81bce8ae-6eee-4527-913a-531e6554c85d.png)

![Ekran Görüntüsü - 2022-12-28 15-07-05](https://user-images.githubusercontent.com/73036927/209809862-c97c0669-deab-46dc-aa92-6619b55534de.png)

* Projenin üçüncü seçeneğinde ise dosya izinleri değiştirilme işlemleri yapılır. Bu değiştirme işlemleri numerik, sembolik ve seçilen sahip ya da sahiplerden izin ekleme/çıkarma olarak yapılır.

![Ekran Görüntüsü - 2022-12-28 15-10-35](https://user-images.githubusercontent.com/73036927/209810343-a655a389-1ea6-4555-8a7c-de9c7af0e38a.png)


* Sembolik olarak değiştirme işleminde ilk olarak izni değiştirelecek dosya seçilir ve daha sonra sahip/sahipler seçilir son olarak verilecek izinler seçildikten sonra izin verme işlemi gerçekleşir.

![Ekran Görüntüsü - 2022-12-28 15-21-37](https://user-images.githubusercontent.com/73036927/209811550-c8adff8d-2e43-401b-832d-d76d504cf603.png)

![Ekran Görüntüsü - 2022-12-28 15-21-44](https://user-images.githubusercontent.com/73036927/209812612-4341f513-884b-4a67-9d09-ee2a437f9909.png)


![Ekran Görüntüsü - 2022-12-28 15-21-51](https://user-images.githubusercontent.com/73036927/209812411-71beb3ce-5201-4ec4-98e0-2506bfafed96.png)

* Numerik olarak seçmek için ise aşağıdaki formattaki gibi bir sayı verilerek izin işlemi atanır. İlk sayı userı temsil, ikinci sayı group ve üçüncü sayı ise other sahibini temsil eder. Kullanıcı bu format dışında bir sayı verirse eğer hatayla karşılaşacaktır.

![Ekran Görüntüsü - 2022-12-28 15-41-41](https://user-images.githubusercontent.com/73036927/209814000-465a7e70-0243-4f0f-a955-4caba1cb7b4d.png)


![Ekran Görüntüsü - 2022-12-28 15-40-31](https://user-images.githubusercontent.com/73036927/209813908-63548c84-243a-4122-a92b-593b2b3f25c5.png)



* Menu dördüncü seçeneği ise dosyanın içeriğini görüntülenmesi ve eğer istenilirse değiştirimesini sağlar.

![Ekran Görüntüsü - 2022-12-28 15-49-08](https://user-images.githubusercontent.com/73036927/209814853-40177268-cb0f-4816-a235-1beffcb53aad.png)

* Menu beşinci seçeneği ise diskin doluluk oranını gösterir. `df -h` komutundan ilgili veri alınarak zenity progress dialog üzerinden gösterilmiştir.

![Ekran Görüntüsü - 2022-12-28 15-52-08](https://user-images.githubusercontent.com/73036927/209815236-c55503da-a788-40f8-adc6-56ac770c1bc5.png)

* Menünün altıncı seçeneği ise `history` komutundan alınan geçmiş komutları listeler ve listenen komutlardan seçilen komutun eğer tekrar çalıştırılması mümkünse tekrar çalıştırılır.

![Ekran Görüntüsü - 2022-12-28 15-56-06](https://user-images.githubusercontent.com/73036927/209815708-70413c8b-be9b-4121-8665-faea68f42e2a.png)

![Ekran Görüntüsü - 2022-12-28 15-56-06](https://user-images.githubusercontent.com/73036927/209815733-18058229-80ab-4b33-8535-e7a4f4750cff.png)

* Son olarak çıkış seçeneği seçilerek uygulamadan çıkılır.

 




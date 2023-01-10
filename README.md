# Linux Shell Script Projesi

Linux bash script dili ile proje geliştirilmiştir. Projenin görsel arayüzü olarak <b>zenity</b> kütüphanesi kullanılmıştır. Linux ve benzeri işletim sistemlerinin en önemli özelliklerinden birisi, <b>her şey bir dosyadır</b> felsefesidir. Bu projede dosya izin işlemleriyle alakalıdır. Uygulamanın temel özellikleri :

<ul>
  <li>Dosya izin işlemleri için bir görsel arayüz </li>
  <li>Dosya içeriklerinin görüntülenmesi ve değiştirilmesi</li>
  <li>Dosya izinlerinin görüntülenmesi</li>
  <li>Diskin yüzdesel olarak doluluk durumu</li>
  <li>Seçilen dosyanın belirli aralıklardaki içeriğini gösterme</li>
</ul>
Uygulamanın temel özellikleri yukarıda listelenmiştir. 



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

* Menünün altıncı seçeneği ise `head` ve  `tail` komutları kullanılarak önceden hazırlamış olduğum şehirleri plakalarıyla beraber bir metin dosyasına kaydettim. Kullanıcıya hangi aralıklar arası görüntüleneceği soruluyor ve o aralıklardaki şehirler görüntüleniyor.

![Ekran Görüntüsü - 2023-01-03 17-26-00](https://user-images.githubusercontent.com/73036927/210379416-cc3894e0-cdf6-4dd6-97d8-232d6e53bd5c.png)

![Ekran Görüntüsü - 2023-01-03 17-26-08](https://user-images.githubusercontent.com/73036927/210379485-c9d72cfb-4cdc-48d3-b943-e56c02c5c457.png)

![Ekran Görüntüsü - 2023-01-03 17-26-15](https://user-images.githubusercontent.com/73036927/210379583-3578aa61-443f-4d81-bb99-e2f495bf8217.png)

![Ekran Görüntüsü - 2023-01-03 17-26-23](https://user-images.githubusercontent.com/73036927/210379645-525c94d3-64da-408c-9252-3147ad6f0819.png)


* Son olarak çıkış seçeneği seçilerek uygulamadan çıkılır.

 




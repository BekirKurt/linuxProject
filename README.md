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








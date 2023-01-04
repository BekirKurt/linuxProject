#!/bin/bash

menu()
{
	while true
	do
		secim=`(zenity --width=600 --height=400 --list --column="Seçenekler" --title="MENU" --text="Yapmak istediginiz islemi seciniz"\
		"Yeni dosya oluştur" \
		"Dosyaların izinlerini görüntüle"\
		"Dosyanın izinlerini değiştir"\
		"Dosyaların içeriğini görüntüle ve değiştir"\
		"Diskin doluluk oranı"\
		"Belli satırlar arası içeriği görüntüleme"\
		"Çıkış"
		)`

	if [ $? -ne 0 ]
	then zenity --warning --text="Seçim yapmadınız çıkış yapılıyor." --width=300;	exit 1
	else
		case $secim in
			"Yeni dosya oluştur") createNewFile;;
			"Dosyaların izinlerini görüntüle") showPermissions;;
			"Dosyanın izinlerini değiştir") changePermissionMenu ;;
			"Dosyaların içeriğini görüntüle ve değiştir") showContent ;;
			"Diskin doluluk oranı") diskFree;;
			"Belli satırlar arası içeriği görüntüleme") showRows;;
			"Çıkış") exit ;;
			*) zenity --warning --text="Lütfen seçeneklerden birini seçiniz!!" --width=300
		esac
	fi
	done
}

createNewFile()
{
	fileName=`zenity --entry --text="Dosya adını giriniz :" --width=300`
	if [ $? -eq 0 ]
	then
	    if [ -n "$fileName" ]
	    then komut=`touch $fileName`
	         zenity --info --text="Dosya başarılı bir şekilde olusturuldu." --width=300
	    else zenity --warning --text="Lütfen dosya adını giriniz !!"
		 createNewFile
	    fi
	else zenity --warning --text="Dosya oluşturulamadı!!!" --width=300
	fi
	menu

}
selectFile()
{
	secilenDosya=`zenity --file-selection --text="select a file"`
	if [ $? -eq 0 ]
	then selectUser $secilenDosya
	else zenity --warning --text="Dosya seçilemedi!!!" --width=400
	fi
	menu
}
selectUser()
{
	secim2=`(zenity --width=600 --height=500 --list --checklist --column="Değiştir" --column="kullanıcılar" --title="İzinleri Seçiniz :" --text="Değiştirmek istediğiniz kullanıcıkarı seçiniz:"\
		"user" "user" "group" "group" "other" "other")`
	if [ $? -ne 0 ]
	then	zenity --warning --text="Seçilmedi"
	else
		case $secim2 in
			"user") changePermission u $1;;
			"group") changePermission g $1;;
			"other") changePermission o $1;;
			"user|group") changePermission ug $1;;
			"user|other") changePermission uo $1;;
			"group|other") changePermission go $1;;
			"user|group|other") changePermission ugo $1;;
			*) zenity --warning --width=300 --text="Lütfen seçeneklerden birini seçiniz !!"
			   menu;;
		esac
	fi
	# echo "$secim2"
}

changePermission()
{
	secim3=`(zenity --width=600 --height=500 --list --checklist --column="İzinler" --column="İzinler" --text="Vermek istediğiniz izinleri seçiniz"\
		"read" "read" "write" "write" "execute" "execute")`
	if [ $? -ne 0 ]
	then zenity --warning --text="İzinler seçilmedi!!"
	else
		case $secim3 in
			"read") chmod $1=r $2;;
			"write") chmod $1=w $2;;
			"execute") chmod $1=x $2;;
			"read|write") chmod $1=rw $2;;
			"read|execute") chmod $1=rx $2;;
			"write|execute") chmod $1=wx $2;;
			"read|write|execute") chmod $1=rwx $2;;
			*) chmod 000 $2;;
		esac
	fi
}


changePermissionMenu()
{
	secim=`(zenity --width=600 --height=400 --list --column="degerler" --title="MENU" --text="Yapmak istediginiz islemi seciniz"\
		"Numerik olarak değiştir" \
		"Seçilen sahibe izin ekle" \
		"Seçilen sahipten izin çıkar" \
		"Sembolik olarak değiştir"\
		)`
	if [ $? -ne 0 ]
	then zenity --width=300 --warning --text="Lütfen seçeneklerden birini seçiniz !!"
	else
		case $secim in
			"Numerik olarak değiştir") numericPermission;;
			"Sembolik olarak değiştir") selectFile ;;
			"Seçilen sahibe izin ekle") changePermissionSelectOwner +;;
			"Seçilen sahipten izin çıkar") changePermissionSelectOwner -;;
			*) zenity --warning --text="Lütfen seçeneklerden birini seçiniz !!" --width=300
		esac

	fi
}





changePermissionSelectOwner()
{
	secilenDosya=`zenity --file-selection --width=600 --height=600`
	if [ $? -ne 0 ]
	then zenity --warning --text="Dosya seçilmedi" --width=300
	else
		secim=`(zenity --width=600 --height=500 --list --checklist --column="Sahip" --column="Sahip" --text="İzin eklemek istediğiniz sahibi seçiniz :"\
			"user" "user" "group" "group" "other" "other")`
		if [ $? -ne 0 ]
		then zenity --warning --text="Lütfen sahiğ seçiniz !!"
		else
			case $secim in
				"user") addRemovePermission u $secilenDosya $1;;
				"group") addRemovePermission g $secilenDosya $1;;
				"other") addRemovePermission o $secilenDosya $1;;
				"user|group") addRemovePermission ug $secilenDosya $1;;
				"user|other") addRemovePermission uo $secilenDosya $1;;
				"group|other")  addRemovePermission go $secilenDosya $1;;
				"user|group|other") addRemovePermission ugo $secilenDosya $1;;
				*) zenity --warning --width=300 --text="Kullanıcı seçilmedi !!";;
			esac
		fi
	fi
}

addRemovePermission()
{
	secim=`(zenity --width=600 --height=600 --list --checklist --column="İzinler" --column="İzinler" --text="Eklemek istediğiniz izinleri seçiniz :"\
		"read" "read" "write" "write" "execute" "execute")`
	if [ $? -ne 0 ]
	then zenity --warning --text="İzinler değiştirlmedi !!"
	else
		case $secim in
			"read") chmod $1$3r $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"write") chmod $1$3w $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"execute") chmod $1$3x $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"read|write") chmod $1$3rw $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"read|execute") chmod $1$3rx $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"write|execute") chmod $1$3wx $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			"read|write|execute") chmod $1$3rwx $2; zenity --info --text="İzinler değiştirildi." --width=400 ;;
			*) zenity --warning --width=300 --text="İzinler değiştirilmedi !!";;
		esac
	fi
}

numericPermission()
{
	secilenDosya=`zenity --file-selection --text="Dosya seç"`

	if [ $? -ne 0 ]
	then zenity --warning --text="Dosya seçmediniz !!" --width=300
	else
	value=`zenity --entry --text="Kullanıcı izinlerini numeric olarak değiştir\n" --title="İfade" `

		if [ $? -ne 0 ]
		then zenity --warning --text="Herhangi bir ifade girmediniz !!" --width=300
		else
			re="^[0-7]{3}$"

			if [[ $value =~ $re ]]
			then chmod $value $secilenDosya
			else zenity --warning --text="Geçerli format giriniz !!" --width=300
			fi
		fi
	fi
}

showContent()
{
	secilenDosya=`zenity --width=700 --height=500 --list --column="Görüntülemek istediğiniz dosyayı seçiniz" $(ls)`
	if [ -n "$secilenDosya" ]
	then
		if [ $? -eq 0 ]
		then edit=`zenity --text-info  --title="Dosyanın içeriğini değiştir.." \
	             --filename=$secilenDosya --editable --width=600 --height=600`
		    	if [ $? -eq 0 ]
			then printf "$edit" > $secilenDosya
			     zenity --info --text="içerik değiştirildi" --width=300
			else zenity --warning --text="içerik degiştirilemedi" --width=300
			fi
		else zenity --warning --text="İçerik değiştirilemedi!!" --width=300
		fi
	else zenity --warning --text="Dosya seçilmedi !!" --width=300
	fi
}

showPermissions()
{
	permissions=`ls -ls > permissions.txt`
	zenity --text-info --title="İzinler" --filename="permissions.txt" --width=600 --height=600
}


progressBar()
{
	{
 	for i in {0..100..10}
	 do
	 sleep .1
	 echo $i
	 done
	} | zenity --progress  --title="Yükleniyor"   --text="Yükleniyor..."   --percentage=0 --width=320

}

showRows()
{
	secilenDosya=`zenity --file-selection --text="Dosya seç"`

	if [ $? -ne 0 ]
	then zenity --warning --text="Dosya seçmediniz !!" --width=300
	else
	firstExpr=`zenity --entry --text="Başlamak istediğiniz satır numarasını giriniz \n" --title="Başlangıç" `
		if [ $? -ne 0 ]
		then zenity --warning --text="Herhangi bir ifade girmediniz !!" --width=300
		else
			secondExpr=`zenity --entry --text="Bitirmek istediğiniz satır numarasını giriniz \n" --title="Bitiş"`
			if [ $? -ne 0 ]
			then zenity --warning --text="Herhangi bir ifade girmediniz !!" --width=300
			else
				expr1=`cat $secilenDosya | head -$secondExpr`
				printf "$expr1" > sonuc.txt
				number=`expr $secondExpr - $firstExpr + 1`
				expr2=`cat sonuc.txt | tail -$number`
				printf "$expr2" > sonuc.txt
				progressBar
				edit=`zenity --text-info  --title="İçerik.." --filename=sonuc.txt  --width=600 --height=600`

			fi
		fi
	fi



}

diskFree()
{
	komut="df -h"
	output=$(eval "$komut")
	val=`echo $output | cut -d " " -f 18-18`
	val2=`echo $val | cut -b 1,2`
	echo $val
	echo $val2
	zenity --info --text="Diskin doluluk oranı \n\n $output" --width=600
	zenity --progress --text="Diskin doluluk oranı :$val2" --width=600 --percentage=$val2
}


menu

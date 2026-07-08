/*========================================================================*/
/* SAS BASE İLE ARAÇ FİLO VERİ ANALİZİ VE RAPORLAMA                       */
/*========================================================================*/

/*------------------------------------------------------------------------*/
/* 1. ADIM: VERİ OLUŞTURMA (DATA Step)                                    */
/*------------------------------------------------------------------------*/
data work.arac_verisi;

    /* Değişkenlerin sırası ve veri tipleri */
    input
        plaka        $
        surucu_id    $
        tarih         :ddmmyy10.
        hiz_ort
        km_gidilen
        yakit_litre;

    /* Tarihi ekranda gösterme formatı */
    format tarih date9.;

    /* Örnek veri seti */
    datalines;
34ABC123 S001 01/07/2026 62 210 28.5
34ABC123 S001 02/07/2026 58 180 24.0
06DEF456 S002 01/07/2026 75 320 42.1
06DEF456 S002 02/07/2026 80 350 46.0
35GHI789 S003 01/07/2026 45  90 12.5
35GHI789 S003 02/07/2026 50 110 15.0
34ABC123 S001 03/07/2026 95 400 55.0
06DEF456 S002 03/07/2026 40  60  9.0
;
run;


/*------------------------------------------------------------------------*/
/* 2. ADIM: VERİYİ İNCELEME (PROC PRINT & PROC CONTENTS)                 */
/*------------------------------------------------------------------------*/
proc print data=work.arac_verisi;
    title "Arac Verisi - Ham Liste";
run;

proc contents data=work.arac_verisi varnum;
    title "Degisken Bilgileri ve Metadata";
run;


/*------------------------------------------------------------------------*/
/* 3. ADIM: YENİ DEĞİŞKEN OLUŞTURMA VE KOŞULLU MANTIK                      */
/*------------------------------------------------------------------------*/
data work.arac_verimlilik;

	length verimlilik $5;

    /* Mevcut veri setini oku */
    set work.arac_verisi;

    /* 100 km'deki yakıt tüketimi hesabı */
    yakit_100km = (yakit_litre / km_gidilen) * 100;

    /* Verimlilik sınıflandırması şartları */
    if yakit_100km < 13 then
        verimlilik = "Iyi";
    else if yakit_100km < 15 then
        verimlilik = "Orta";
    else
        verimlilik = "Kotu";

run;

proc print data=work.arac_verimlilik;
    title "Verimlilik Hesaplamasi Sonuclari";
run;


/*------------------------------------------------------------------------*/
/* 4. ADIM: FİLTRELEME                                                    */
/*------------------------------------------------------------------------*/
data work.dusuk_verimlilik;

    set work.arac_verimlilik;

    /* Sadece verimlilik sınıfı 'Kotu' olan kayıtları filtrele */
    if verimlilik = "Kotu";

run;

proc print data=work.dusuk_verimlilik;
    title "Dusuk Verimlilik Gosterimi (Filtrelenmis)";
run;


/*------------------------------------------------------------------------*/
/* 5. ADIM: ÖZET İSTATİSTİKLER (PROC MEANS)                               */
/* Soru: Her aracın ortalama hızı, toplam km'si ve yakıt tüketimi nedir?  */
/*------------------------------------------------------------------------*/
proc means data=work.arac_verimlilik n mean sum min max;
    var hiz_ort km_gidilen yakit_100km;   /* Özetlenecek sayısal sütunlar */
    class plaka;                          /* Plaka bazında grupla ve hesapla */
run;


/*------------------------------------------------------------------------*/
/* 6. ADIM: FREKANS VE DAĞILIM ANALİZİ (PROC FREQ)                        */
/* Soru: Kaç kayıt İyi, kaçı Kötü? Hangi araç hangi kategoriye kaç kez girdi?*/
/*------------------------------------------------------------------------*/
proc freq data=work.arac_verimlilik;
    tables verimlilik;              /* Tek yönlü frekans dağılımı */
    tables plaka * verimlilik;      /* Çapraz tablo (Cross-tab) dağılımı */
run;


/*------------------------------------------------------------------------*/
/* 7. ADIM: FORMATLAMA VE ÇIKTI DÜZENLEME (PROC FORMAT)                   */
/* Sayıları okunur hale getirme ve metinlere görsel etiket ekleme         */
/*------------------------------------------------------------------------*/
proc format;
    /* Metinsel değerler için özel emoji formatı tanımlıyoruz */
    value $verim_fmt
        "Iyi"  = "😀 Iyi"
        "Orta" = "🙃 Orta"
        "Kotu" = "😵 Kotu";
run;

data work.arac_final;
    set work.arac_verimlilik;
    
    format tarih date9.
           yakit_100km 5.1           /* Virgülden sonra 1 basamakla sınırla */
           verimlilik $verim_fmt.;   /* Tanımladığımız özel formatı uygula */
run;

proc print data=work.arac_final;
    title "Formatlanmis ve Duzenlenmis Final Raporu";
run;

# Proje 1: Filo Verimlilik Analizi

Uydurma araç takip verisi üzerinden yakıt verimliliği hesaplama, kategorilere ayırma ve temel istatistiksel özet çıkarma amacıyla hazırlanmış bir SAS uygulama projesidir.

## Amaç

Bu proje, aşağıdaki temel SAS becerilerini uçtan uca bir senaryo üzerinde uygulamak için hazırlanmıştır:

- Ham veriden veri seti oluşturma
- Yeni değişken türetme (hesaplanan alanlar)
- Koşullu mantık ile kategorileştirme
- Filtreleme
- Özet istatistik ve dağılım analizi
- Özel format tanımlama ve uygulama

> **Not:** Kullanılan veri tamamen uydurmadır (`DATALINES` ile elle oluşturulmuştur). Herhangi bir gerçek araç, sürücü veya kuruma ait veri içermez.

## Veri Seti

Proje, 3 aracın 3 günlük hız, kilometre ve yakıt tüketim verisini içeren küçük bir örnek veri setiyle çalışır.

| Değişken | Tip | Açıklama |
|---|---|---|
| `plaka` | Karakter | Aracın plaka bilgisi (uydurma) |
| `surucu_id` | Karakter | Sürücü kimlik kodu (uydurma) |
| `tarih` | Tarih | Kayıt tarihi |
| `hiz_ort` | Sayısal | Günlük ortalama hız (km/sa) |
| `km_gidilen` | Sayısal | Günlük kat edilen mesafe (km) |
| `yakit_litre` | Sayısal | Günlük yakıt tüketimi (litre) |

## İş Akışı

Program aşağıdaki adımları sırasıyla uygular:

1. **Veri oluşturma** — `DATA` adımı ve `DATALINES` ile örnek veri girişi
2. **Veri yapısını inceleme** — `PROC CONTENTS` ile değişken tipleri ve gözlem sayısı kontrolü
3. **Yeni değişken türetme** — 100 km başına yakıt tüketimi (`yakit_100km`) hesaplama
4. **Kategorileştirme** — `IF-THEN-ELSE` ile verimlilik durumu (İyi / Orta / Kötü) atama
5. **Filtreleme** — `WHERE` ile düşük verimli kayıtları ayıklama
6. **Özet istatistik** — `PROC MEANS` ile araç bazında ortalama/toplam/min/max değerler
7. **Dağılım analizi** — `PROC FREQ` ile verimlilik kategorilerinin dağılımı
8. **Formatlama** — `PROC FORMAT` ile özel etiketler ve sayısal görünüm düzenleme

## Dosyalar

```
proje-1-filo-verimlilik/
├── 01_veri_olusturma.sas
├── 02_veri_yapisi_inceleme.sas
├── 03_degisken_turetme.sas
├── 04_filtreleme.sas
├── 05_ozet_istatistik.sas
├── 06_dagilim_analizi.sas
├── 07_formatlama.sas
└── README.md
```

## Nasıl Çalıştırılır

1. Dosyaları sırasıyla (`01` → `07`) SAS Studio veya SAS Enterprise Guide üzerinde açın.
2. Her programı çalıştırdıktan sonra `PROC PRINT` çıktısını kontrol ederek bir sonraki adıma geçin.
3. Tüm adımlar tek bir `.sas` dosyasında birleştirilerek de uçtan uca çalıştırılabilir.

## Örnek Çıktı

`PROC MEANS` adımı sonunda, her aracın ortalama hızı, toplam kat ettiği mesafe ve ortalama yakıt tüketimi görüntülenir. `PROC FREQ` adımı ise araçların hangi verimlilik kategorisine kaç kez düştüğünü özetler.

## Sonraki Adımlar

- İkinci bir tabloyla (`surucu_bilgi`) `MERGE` işlemi denenerek sürücü bazlı analiz eklenebilir.
- Aynı özet istatistikler `PROC SQL` ile yeniden üretilerek iki yöntem karşılaştırılabilir.

## Kullanılan Ortam

- SAS 9.4 / SAS Studio

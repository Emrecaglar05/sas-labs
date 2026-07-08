# SAS Labs

SAS programlama pratiği için oluşturulmuş bir depo. Veri manipülasyonu, SQL entegrasyonu, raporlama ve temel istatistiksel analiz konularında örnek programlar ve uygulamalı projeler içerir.

## İçindekiler

- [Genel Bakış](#genel-bakış)
- [Depo Yapısı](#depo-yapısı)
- [Kapsanan Konular](#kapsanan-konular)
- [Başlarken](#başlarken)
- [Kullanılan Araçlar](#kullanılan-araçlar)
- [Notlar](#notlar)

## Genel Bakış

Bu depo, SAS programlama dilini öğrenme ve pratik yapma sürecinde oluşturulan çalışmaları bir araya getirir. Amaç; veri erişiminden manipülasyona, filtrelemeden istatistiksel analiz ve raporlamaya kadar uçtan uca bir veri işleme akışını örneklerle ortaya koymaktır.

> **Not:** Bu depodaki tüm veri setleri örnek/uydurma verilerdir. Herhangi bir gerçek, kişisel veya kuruma ait hassas veri içermez.

## Depo Yapısı

```
sas-labs/
├── data/                  # Örnek/uydurma veri setleri (csv, txt)
├── sql-connection/        # PROC SQL, Pass-Through ve veri bağlantı örnekleri
├── data-manipulation/     # DATA step, SET, MERGE, KEEP/DROP örnekleri
├── filtering/             # WHERE, IF-THEN-ELSE örnekleri
├── statistics/            # PROC MEANS, PROC FREQ, PROC CONTENTS örnekleri
├── formatting/            # FORMAT, INFORMAT, PROC FORMAT örnekleri
├── projects/              # Uçtan uca mini projeler
└── README.md
```

## Kapsanan Konular

| Konu | Açıklama |
|---|---|
| **SQL Veri Bağlantısı** | `PROC SQL` kullanımı, Pass-Through yöntemi ile harici veritabanı bağlantısı |
| **Veri Manipülasyonu** | `DATA` adımı, `SET`, `MERGE`, `KEEP`/`DROP`, yeni değişken türetme |
| **Filtreleme ve Koşullar** | `WHERE` ile satır filtreleme, `IF-THEN-ELSE` ile koşullu mantık |
| **İstatistiksel Prosedürler** | `PROC MEANS`, `PROC FREQ`, `PROC CONTENTS` |
| **Veri Formatlama** | `FORMAT`, `INFORMAT`, kullanıcı tanımlı formatlar (`PROC FORMAT`) |

## Başlarken

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/kullanici-adi/sas-labs.git
   ```
2. `.sas` uzantılı dosyaları SAS Studio, SAS Enterprise Guide veya SAS OnDemand for Academics üzerinde açın.
3. Her klasördeki programları sırasıyla çalıştırarak ilerleyin — kod blokları içinde açıklayıcı yorum satırları bulunur.

## Kullanılan Araçlar

- **SAS 9.4 / SAS Studio**
- Örnek veri setleri: `DATALINES` ile oluşturulan uydurma veriler

## Notlar

Bu depo öğrenme amaçlı hazırlanmıştır ve production ortamında kullanılmak üzere tasarlanmamıştır. Katkı, öneri veya düzeltmeler için issue/PR açabilirsiniz.

## Lisans

Bu proje eğitim amaçlı paylaşılmıştır.

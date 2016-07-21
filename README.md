# File Bucket
Redmine projelerinde kullanılan modüller ile yüklenmiş dosyaların tek bir sayfadan görüntülenmesini sağlar. 

## Desteklenen Modüller:
* İşler
* Wiki Sayfaları
* Belgeler
* Projeler
* Sürümler
* Haberler
* Altprojeler

## Özellikleri
1. Alt projeleri de destekler. Ana proje üzerinden görüntülenen dosya listesine alt projelerdeki dosyalar da dahil edilebilir.
2. Proje bazlı etkinleştirilebilir ya da pasifleştirilebilir.
3. Her proje için ayrı ayar kaydedilebilir.
4. Rol bazlı izin ayarlanabilir. İstenilen rollerin dosya listesini görüntüleyememesi sağlanabilir.
5. Dosyaların adının yanı sıra; nereye yüklendiği, boyutu, dosya için yapılan yorum, bulunduğu sayfanın bağlantısı, hangi alt projeye eklendiği, yükleyen yazarın ismi, oluşturulma tarihi ve indirme sayısı da görüntülenir.

## Ayarlar
* Eklenti ayarlarına yönetici hesabı ile /settings/plugin/redmine_file_bucket adresinden ulaşılabilir.
* Eklentinin bir liste oluşturabilmesi için tarayıp göstereceği modüller ayarlar sayfasından pasifleştirilebilir ya da etkinleştirilebilir. Aç/Kapa yapılabilecek modüllerin listesi:
  * İşler
  * Wiki Sayfaları
  * Belgeler
  * Projeler
  * Sürümler
  * Haberler
  * Altprojeler

## Kullanımı
* Eklentiye /projects/proje_adi/file_bucket bağlantısından ulaşılabilir. Bu bağlantı proje menüsü üzerinde 'Eklentiler' ismiyle bulunabilir.
* Daha rahat bir kullanım tecrübesi için eklentiye sayfalama özelliği eklenmiştir. Bu özellik sol taraftaki seçim kutusundan 'hepsi' seçilerek kapatılabilir.
* Sağ üstte bulunan arama kutusu ile eklenti listesinde anlık (sayfa yenilemeden) arama yapılabilir.
* Dosya listesinde filtreleme yapmak için üst bölümde bulunan seçim kutuları kullanılabilir. Örneğin listede alt projelere eklenen dosyaların gösterilmesi istenmiyorsa 'alt projeler' seçeneği kapatılmalıdır.
* Dosya formatına göre filtreleme yapmak için arama kutusuna örn. '.jpg' yazılabilir.Bu durumda liste sadece jpg formatındaki dosyaların görüntülenmesi için filtrelenecektir.Eğer arama kutusuna abcd yazılırsa adında abcd geçen dosyalar listelenir.
* Herhangi bir dosyayı kaldırmak için, satır sonunda bulunan çöp kutusu simgesine tıklanabilir. Bu silme işlemi dosyayı eklendiği yerden de (örneğin bir iş kaydı) silecektir.


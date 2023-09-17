/// pubspec Oluşturma
///
/// pubspec, uygulamanızın kök dizininde bulunan pubspec.yaml adlı bir dosyadır. En basit pubspec dosyası sadece paket adını listeler:
///
/// ```bash
///   name: my_app
/// ```
///
/// İşte pub.dev sitesinde barındırılan iki paketin (js ve intl) bağımlılıklarını bildiren bir pubspec örneği:
///
/// ```bash
///   name: my_app
///  
///   dependencies:
///     js: ^0.6.0
///     intl: ^0.17.0
/// ```
///
/// Pubspec.yaml dosyasını manuel olarak düzenlemeden güncellemek için dart pub add komutunu çalıştırabilirsiniz. Aşağıdaki örnek, vector_math bağımlılığını ekler.
///
/// ```bash
/// dart pub add vector_math
/// ```
/// Bağımlılıklar çözülüyor... 
/// + vector_math 2.1.3
/// vector_math 2.1.3 indiriliyor...
/// 1 bağımlılık güncellendi!
///
/// Pubspec oluşturmanın ayrıntıları için pubspec belgelerine ve kullanmak istediğiniz paketlerin belgelerine bakınız.
/// Paketleri Alma
///
/// Bir pubspec dosyanız olduğunda, uygulamanızın kök dizininden dart pub get komutunu çalıştırabilirsiniz:
///
///```bash
///  cd <my_app-dizin-yolu>
///
///  dart pub get
///```
///
/// Bu işlem, bağımlılıkları almak olarak adlandırılır.
///
/// dart pub get komutu, uygulamanızın hangi paketlere bağımlı olduğunu belirler ve bunları merkezi bir sistem önbelleğine koyar. Uygulamanız bir yayınlanmış bir pakete bağımlıysa, pub bu paketi pub.dev sitesinden indirir. Bir Git bağımlılığı durumunda, pub Git deposunu klonlar. Dolaylı bağımlılıklar da dahil edilir. Örneğin, js paketi test paketine bağlıysa, pub hem js paketini hem de test paketini alır.
///
/// Pub, her bir paket adınızı, uygulamanızın sistem önbelleğindeki karşılık gelen pakete eşleyen bir package_config.json dosyası oluşturur (.dart_tool/ dizini altında).
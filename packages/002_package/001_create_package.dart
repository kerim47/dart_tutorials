/// # Yeni bir paket oluşturma
///
/// Başlangıç bir dizin ve yapı oluşturmak için, `dart create` komutunu ve `package` şablonunu kullanabilirsiniz:
///
/// ```bash
/// dart create -t package <PAKET_ADı>
/// ```
///
/// # Bir Paketi Oluşturan Unsurlar
///
/// Aşağıdaki diagram, bir paketin en basit yapısını gösterir:
///
/// ```
/// kök dizin -> pubspec.yaml ve lib/file.dart içerir
/// ```
///
/// Bir kütüphane için minimal gereksinimler şunlardır:
///
/// 1. `pubspec` dosyası
///    Bir kütüphane için `pubspec.yaml` dosyası, bir uygulama paketi için olanı ile aynıdır ve paketin bir kütüphane olduğunu belirten özel bir işaretleme yoktur.
///    
/// 2. `lib` dizini
///    Kütüphane kodları genellikle `lib` dizini altında bulunur ve diğer paketlere açıktır. İhtiyaca göre `lib` altında herhangi bir hiyerarşi oluşturabilirsiniz. Geleneksel olarak, implementasyon kodları `lib/src` altına yerleştirilir. `lib/src` altındaki kodlar, özel olarak kabul edilir ve diğer paketlerin `src/...` şeklinde içe aktarılması gerekmeyecektir. `lib/src` altındaki API'ları genel hale getirmek için, `lib` altında doğrudan bulunan bir dosyadan `lib/src` dosyalarını ihraç edebilirsiniz.
///
/// # Bir Paketi Organize Etme
///
/// Paketler, küçük, bağımsız kütüphaneler olarak adlandırılan ve çoğu durumda her sınıfın kendi kütüphanesinde olduğu şekilde oluşturulduğunda en kolay bakım, genişletme ve test yaparlar.
///
/// Not: "part" direktifini kullanmanız gereken, bir kütüphaneyi birden çok Dart dosyasına bölen, daha önce duymuş olabilirsiniz. "part" kullanımından kaçınılmasını ve bunun yerine küçük kütüphaneler oluşturmanızı öneririz.
///
/// `lib` altında doğrudan `lib/<paket-adı>.dart` olarak bir "ana" kütüphane dosyası oluşturun ve tüm genel API'leri bu dosyadan içe aktarın. Bu, kullanıcının tüm kütüphane işlevselliğini tek bir dosyayı içe aktararak elde etmesini sağlar.
///
/// `lib` dizini, ayrıca başka içe aktarılabilir, src dışı kütüphaneleri de içerebilir. Örneğin, ana kütüphaneniz platformlarda çalışan bir iş yapıyorsa, dart:io veya dart:html'e dayalı ayrı kütüphaneler oluşturabilirsiniz. Bazı paketlerin, ana kütüphanesi değilken bir öneki ile içe aktarılması gereken ayrı kütüphaneleri bulunmaktadır.
///
/// Örnek bir paketin organizasyonuna bakalım: shelf. Shelf paketi, Dart kullanarak web sunucuları oluşturmanın kolay bir yolunu sağlar ve genellikle Dart paketleri için yaygın olarak kullanılan bir yapıda düzenlenmiştir:
///
/// ```
/// shelf kök dizini -> example, lib, test ve tool alt dizinleri içerir
/// ```
///
/// Doğrudan `lib` altında, ana kütüphane dosyası olan `shelf.dart`, lib/src içindeki birkaç dosyadan gelen API'yi ihraç eder. Daha fazla API'yi sergilememek ve paketin tüm genel API'sini geliştiricilere sunmak için `shelf.dart`, sadece ihraç edilecek sembolleri belirtmek için `show` kullanır:
///
/// ```dart
/// export 'src/cascade.dart' show Cascade;
/// export 'src/handler.dart' show Handler;
/// export 'src/hijack_exception.dart' show HijackException;
/// // Diğer ihraç edilenler...
/// ```
///
/// Shelf paketi, ayrıca bir mini kütüphane içerir: shelf_io. Bu adaptör, dart:io'dan gelen HttpRequest nesnelerini işler.
///
/// Öneri: webdev serve ile geliştirme yaparken geliştirirken performans açısından en iyi sonuçları almak için /lib/src altına, /lib altında olmayan yerlere yerine getirme dosyalarını yerleştirin. Ayrıca, package:package_name/src/.... ithalatlarından kaçının.
///
/// # Kütüphane Dosyalarını İçe Aktarma
///
/// Başka bir paketten bir kütüphane dosyasını içe aktarırken, o dosyanın URI'sini belirtmek için package: direktifini kullanın:
///
/// ```dart
/// import 'package:utilities/utilities.dart';
/// ```
///
/// Kendi paketinizden bir kütüphane dosyasını içe aktarırken, her iki dosya da lib içindeyken veya her iki dosya da lib dışında olduğunda bir göreceli yol kullanın. İçe aktarılan dosya lib içindeyse ve içe aktaran dışarıdaysa, kullanılan paket içeriyse, package: kullanın.
///
/// Aşağıdaki grafik, lib/foo/a.dart dosyasını lib ve web içinden nasıl içe aktaracağınızı gösterir.
///
/// lib/bar/b.dart, göreceli bir içe aktarma kullanır; web/main.dart bir paket içe aktarma kullanır
/// Kütüphane Dosyalarını Koşula Bağlı İçe Aktarma ve İhraç Etme
///
/// Kütüphaneniz birden çok platformu destekliyorsa, dosyaları koşula bağlı olarak içe aktarmanız veya ihraç etmeniz gerekebilir. Ortak kullanılan bir senaryo, hem web hem de yerel platformları destekleyen bir kütüphan
///
/// edir.
///
/// Koşula bağlı olarak içe aktarma veya ihraç etme işlemi için dart:* kütüphanelerinin varlığını kontrol etmeniz gerekir. İşte dart:io ve dart:html varlığına bağlı olarak koşullu olarak ihraç etme kodunun bir örneği:
///
/// ```dart
/// export 'src/hw_none.dart' // Yedek uygulama
///     if (dart.library.io) 'src/hw_io.dart' // dart:io uygulaması
///     if (dart.library.html) 'src/hw_html.dart'; // dart:html uygulaması
/// ```
///
/// lib/hw_mp.dart
///
/// Bu kodun ne yaptığı:
///
/// - dart:io kullanabilen bir uygulamada (örneğin, bir komut satırı uygulaması) src/hw_io.dart dosyasını ihraç eder.
/// - dart:html kullanabilen bir uygulamada (bir web uygulaması) src/hw_html.dart dosyasını ihraç eder.
/// - Aksi durumda src/hw_none.dart dosyasını ihraç eder.
///
/// Dosyayı koşula bağlı olarak içe aktarmak için, yukarıdaki kodu kullanın, ancak export yerine import kullanın.
///
/// Not: Koşula bağlı içe aktarma veya ihraç etme, yalnızca kütüphanenin mevcut platformda kullanılabilir olup olmadığını kontrol eder, gerçekten içe aktarılıp kullanılıp kullanılmadığını değil.
///
/// Tüm koşula bağlı ihraç edilen kütüphaneler aynı API'yi uygulamalıdır. Örneğin, işte dart:io uygulaması:
///
/// ```dart
/// import 'dart:io';
///
/// void alarm([String? text]) {
///   stderr.writeln(text ?? message);
/// }
///
/// String get message => 'Merhaba Dünya VM tarafından!';
/// ```
///
/// lib/src/hw_io.dart
///
/// Ve işte varsayılan uygulama, kullanmadan Desteklenmeyen Hata atan yer tutucularını kullanır:
///
/// ```dart
/// void alarm([String? text]) => throw UnsupportedError('hw_none alarm');
///
/// String get message => throw UnsupportedError('hw_none message');
/// ```
///
/// lib/src/hw_none.dart
///
/// Herhangi bir platformda, koşula bağlı ihraç edilen kütüphanelerden herhangi birini içe aktarabilirsiniz:
///
/// ```dart
/// import 'package:hw_mp/hw_mp.dart';
///
/// void main() {
///   print(message);
/// }
/// ```
///
/// # Ek Dosyalar Sağlama
///
/// İyi tasarlanmış bir paketin test edilmesi kolaydır. Testlerinizi test paketi kullanarak yazmanızı ve test kodunu paketin en üstündeki test dizinine yerleştirmenizi öneririz.
///
/// Kamu tüketimi için tasarlanmış komut satırı araçları oluşturursanız, bunları genel olan bin dizinine yerleştirin. dart pub global activate kullanarak bir aracı komut satırından çalıştırmayı etkinleştirin. Aracın dart pub global run'ı çağırmadan doğrudan çalıştırılmasına izin vermek için pubspec'in executables bölümünde aracı listelemek gerekir.
///
/// Kütüphanenizi nasıl kullanacağınızın bir örneğini dahil etmek faydalı olacaktır. Bu, paketin en üstündeki örnek dizinine yerleştirilir.
///
/// Geliştirme sırasında herkese açık kullanım için olmayan araçlar veya yürütülebilirler oluşturursanız, bunlar araç dizinine yerleştirilir.
///
/// Paketinizi pub.dev sitesinde paylaşmanızı öneririz eğer açık kaynaklı bir kütüphaneniz varsa. Kütüphanenizi yayınlamak veya güncellemek için paketinizi oluşturmanıza yardımcı olan `pub publish` komutunu kullanın. Yayınlamak için paketinizi hazırlama ayrıntıları için Paket Yayınlama kısmına bakın.
///
/// pub.dev sitesi sadece paketinizi barındırmakla kalmaz, aynı zamanda paketinizin API referans belgelerini üretir ve barındırır. En son üretilen belgelere bir bağlantı, paketin About kutusunda bulunur; örneğin, shelf paketinin API belgelerine bakın. Önceki sürümlerin belgelere olan bağlantıları, paket sayfasının Versiyonlar sekmesinde bulunur.
///
/// Paketinizin API belgelerinin pub.dev sitesinde iyi görünmesini sağlamak için şu adımları izleyin:
///
/// - Paketinizi yayınlamadan önce, belgelerinizin başarılı bir şekilde üretildiğinden ve beklenildiği gibi göründüğünden emin olmak için `dart doc` aracını çalıştırın.
/// - Paketinizi yayınladıktan sonra, belgelerin başarılı bir şekilde üretildiğinden emin olmak için Versiyonlar sekmesini kontrol edin.
/// - Belgeler hiç üretilmezse, dart doc çıktısını görmek için Versiyonlar sekmes
$.getJSON("../jsons/carousel.json") // json dosyası alın.
    .done(function (data) { //dosya başarıyla geldi 

        var cardTemplate = $("#carousel-item-template").html(); // Şablonu alın
        // jsx temelleri jsxml

        $.each(data, function (index, element) {
            // Her bir öğe için kartı oluşturun

            var _image = "../assets/carousel/"+element.url
            var cardHTML = cardTemplate
                .replace("{{image}}", _image)
                .replace("{{alt}}",element.alt)
                .replace("{{active}}",element.active?"active":"false"); // and => & or => ||
                //(koşul) ? true dönerse : false dönerse
                // Kartı ilgili alana ekleyin
                    $("#carouselContainer").append(cardHTML);
            //console.log(index, element);
        });
    })
    .fail(function (jqxhr, textStatus, error) {
        var err = textStatus + ", " + error;
        console.log("Dosya yüklenirken bir hata oluştu: " + err);
        // Hata durumunda gerekli işlemleri yapabilirsiniz
    });

    document.addEventListener("DOMContentLoaded", function() {
        var carousel = document.getElementById("carouselExample");
        var carouselInstance = new bootstrap.Carousel(carousel, {
          interval: 5000, // Otomatik geçiş hızı (ms cinsinden)
          keyboard: true, // Klavye ile kontrol etme
          pause: "hover", // Fare üzerine gelindiğinde geçişi durdurma
          wrap: true // Son resimden ilk resime geçiş
        });
      });
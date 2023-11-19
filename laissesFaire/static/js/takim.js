$.getJSON("../jsons/takimSemasi.json") // json dosyası alın.
    .done(function (data) { //dosya başarıyla geldi 

        var cardTemplate = $("#card-template").html(); // Şablonu alın


        $.each(data, function (index, element) {
            // Her bir öğe için kartı oluşturun

            //görseller oluşturulur.
            var _image = "";
            if (element.image == "") {
                _image = "../assets/takimuyeleri/tilki.jpg";
            } else {
                _image = "../assets/takimuyeleri/" + element.image;
            }
            //görsel hata ayıklama

            var cardHTML = cardTemplate
                .replace("{{image}}", _image)
                .replace("{{name}}", element.name)
                .replace("{{surname}}", element.surname)
                .replace("{{title}}", element.title)
                .replace("{{size}}", (element.level === 3 || element.level === 4) ? 4 : 2); // and => & or => ||
                //(koşul) ? true dönerse : false dönerse
                // Kartı ilgili alana ekleyin
            switch (element.level) {
                case 1:
                    $("#takimkaptani").append(cardHTML);
                    break;
                case 2:
                    $("#prrobotkaptani").append(cardHTML)
                    break;
                case 10:
                    $("#mentorler").append(cardHTML);
                    break;
                case 3:
                    $("#robotikuyeleri").append(cardHTML);
                    break;
                case 4:
                    $("#pruyeleri").append(cardHTML);
                    break;
                default:
                    //$("#takimuyeleri").append(cardHTML);
                    break;
            }
            //console.log(index, element);
        });
    })
    .fail(function (jqxhr, textStatus, error) {
        var err = textStatus + ", " + error;
        console.log("Dosya yüklenirken bir hata oluştu: " + err);
        // Hata durumunda gerekli işlemleri yapabilirsiniz
    });

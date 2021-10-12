//エリア→国の絞り込み
$(document).on('turbolinks:load', function() {
  //HTMLが読み込まれた時の処理
  var areaVal = $('#place_area').val();
  var countryVal = $('#place_country').val();
  //一度目に検索した内容がセレクトボックスに残っている時用のif文
  if (areaVal !== "") {
    var selectedTemplate1 = $("#country-of-area_" + areaVal);
    var selectedTemplate2 = $("#city-of-country_" + countryVal);
    $('#place_country').remove();
    $('#place_area').after(selectedTemplate1.html());
    $('#place_country').after(selectedTemplate2.html());
  };

  //先ほどビューファイルに追加したもともとある子要素用のセレクトボックスのHTML
  var defaultCountrySelect = `<select name="place[country]" id="place_country">
  <option value>国を選択してください</option>
  </select>`;

  //先ほどビューファイルに追加したもともとある子要素用のセレクトボックスのHTML
  var defaultCitySelect = `<select name="place[city]" id="place_city">
  <option value>都市を選択してください</option>

  </select>`;
  $(document).on('change', '#place_area', function() {
    var areaVal = $('#place_area').val();
    //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
    if (areaVal !== "") {
     var selectedTemplate1 = $("#country-of-area_" + areaVal);
     //デフォルトで入っていた子要素のセレクトボックスを削除
     $('#place_country').remove();
     $('#place_area').after(selectedTemplate1.html());
    }else {
     //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
     $('#place_country').remove();
     $('#place_city').remove();
     $('#place_area').after(defaultCountrySelect);
     $('#place_country').after(defaultCitySelect);
    };
  });

  //国→都市の絞り込み
  //HTMLが読み込まれた時の処理
  var countryVal = $('#place_country').val();
  //一度目に検索した内容がセレクトボックスに残っている時用のif文
  if (countryVal !== "") {
    var selectedTemplate2 = $("#city-of-country_" + countryVal);
    $('#place_city').remove();
    $('#place_country').after(selectedTemplate2.html());
  };

  $(document).on('change', '#place_country', function() {
    var countryVal = $('#place_country').val();
    //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
    if (countryVal !== "") {
     var selectedTemplate2 = $("#city-of-country_" + countryVal);
     //デフォルトで入っていた子要素のセレクトボックスを削除
     $('#place_city').remove();
     $('#place_country').after(selectedTemplate2.html());
    }else {
     //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
     $('#place_city').remove();
     $('#place_country').after(defaultCitySelect);
    };
  });
});
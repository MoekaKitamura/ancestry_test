//エリア→国の絞り込み
$(document).on('turbolinks:load', function() {
  //HTMLが読み込まれた時の処理
  var areaVal = $('#trip_area').val();
  //一度目に検索した内容がセレクトボックスに残っている時用のif文
  if (areaVal !== "") {
   var selectedTemplate1 = $("#country-of-area_" + areaVal);
   $('#trip_country').remove();
   $('#trip_area').after(selectedTemplate1.html());
  };

  //先ほどビューファイルに追加したもともとある子要素用のセレクトボックスのHTML
  var defaultCountrySelect = `<select name="trip[country]" id="trip_country">
                              <option value>国を選択してください</option>
                              </select>`;
                                  
  $(document).on('change', '#trip_area', function() {
   var areaVal = $('#trip_area').val();
   //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
   if (areaVal !== "") {
    var selectedTemplate1 = $("#country-of-area_" + areaVal);
    //デフォルトで入っていた子要素のセレクトボックスを削除
    $('#trip_country').remove();
    $('#trip_area').after(selectedTemplate1.html());
   }else {
    //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
    $('#trip_country').remove();
    $('#trip_area').after(defaultCountrySelect);
   };
  });
 });

 //国→都市の絞り込み
$(document).on('turbolinks:load', function() {
  //HTMLが読み込まれた時の処理
  var countryVal = $('#trip_country').val();
  //一度目に検索した内容がセレクトボックスに残っている時用のif文
  if (countryVal !== "") {
   var selectedTemplate2 = $("#city-of-country_" + countryVal);
   $('#trip_city').remove();
   $('#trip_country').after(selectedTemplate2.html());
  };

  //先ほどビューファイルに追加したもともとある子要素用のセレクトボックスのHTML
  var defaultCitySelect = `<select name="trip[city]" id="trip_city">
                            <option value>都市を選択してください</option>
                            </select>`;
                                  
  $(document).on('change', '#trip_country', function() {
   var countryVal = $('#trip_country').val();
   //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
   if (countryVal !== "") {
    var selectedTemplate2 = $("#city-of-country_" + countryVal);
    //デフォルトで入っていた子要素のセレクトボックスを削除
    $('#trip_city').remove();
    $('#trip_country').after(selectedTemplate2.html());
   }else {
    //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
    $('#trip_city').remove();
    $('#trip_country').after(defaultCitySelect);
   };
  });
 });
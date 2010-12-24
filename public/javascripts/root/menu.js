$(function(){
  var map;
  var marker;
  (function(){
    var stylez = [ {featureType: "road",     elementType: "geometry"},
                   {featureType: "landscape",elementType: "geometry"}];
    var pos = new google.maps.LatLng(35.658613, 139.745525);
    map = new google.maps.Map($("#map_canvas").get(0), { zoom: 15, center: pos });
    var geocoder = new google.maps.Geocoder();
    var shop_name = $('#schedule_shop_name').val();
    geocoder.geocode( {'address': $('#schedule_shop_address').val() }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({map: map,
                                         title: shop_name, 
                                         position: results[0].geometry.location});
        //マーカをクリックしたらふきだしを出す。
        var infowindow = new google.maps.InfoWindow({
          content: ['<h2>' + $('#schedule_title').val() + '</h2>',
                    '実施日:' + $('#schedule_start_date').val(),
                    '場所:' + '<a href="'+ $('#schedule_shop_url').val() + '">' + shop_name + '</a>',
                    '詳細:' + '<a href="/schedules/'+ $('#schedule_id').val() +'">' + 'schedule' + '</a>',
                    '<input type="submit" value="日記へ" onclick="function(){ document.getElementByName(\'commit\').click();  }">'].join('<br />')
        });
      } else {
        deafult_geo(pos, marker);
      }
      
      google.maps.event.addListener(marker, 'click', function(){
        infowindow.open(map, marker);
      });
      infowindow.open(map, marker);
    });
    var name = 'mapit';

    var jayzMapType = new google.maps.StyledMapType(stylez, { map: map, mapTypeId: google.maps.MapTypeId.ROADMAP, name: name });
    map.mapTypes.set(name, jayzMapType);
    map.setMapTypeId(name);
  })();
});

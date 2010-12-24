$(function(){
  var schedule = {};
  $.each($("[id^=schedule]"), function(i, node){
    schedule[node.id.replace(/^schedule_/, '')] = node.value;
  });
  
  (function(canvas, schedule){
    var stylez = [ {featureType: "road",     elementType: "geometry"},
                   {featureType: "landscape",elementType: "geometry"}];
    var map = new google.maps.Map(canvas, { zoom: 15, center: (new google.maps.LatLng(35.658613, 139.745525)) });
    (new google.maps.Geocoder()).geocode( {'address': schedule['shop_address'] }, function(results, status) {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({map: map,
                                           title: schedule['shop_name'],
                                           position: results[0].geometry.location});
      var infowindow = new google.maps.InfoWindow({
        content: ['<h2>' + schedule['title'] + '</h2>',
                  '実施日:' + schedule['start_date'],
                  '場所:' + '<a href="'+ schedule['shop_url'] + '">' + schedule['shop_name'] + '</a>',
                  '詳細:' + '<a href="/schedules/'+ schedule['id'] +'">' + 'schedule' + '</a>',
                  '<input type="submit" value="日記へ" onclick="function(){ document.getElementByName(\'commit\').click();  }">'].join('<br />')
      });
      
      google.maps.event.addListener(marker, 'click', function(){
        infowindow.open(map, marker);
      });
      infowindow.open(map, marker);
    });
    var name = 'mapit';
    var jayzMapType = new google.maps.StyledMapType(stylez, { map: map, mapTypeId: google.maps.MapTypeId.ROADMAP, name: name });
    map.mapTypes.set(name, jayzMapType);
    map.setMapTypeId(name);
  })($("#map_canvas").get(0), schedule);
});

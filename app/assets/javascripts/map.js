function SetupMap() {

  var map = L.mapbox.map('map', 'examples.h186knp8').setView([-33.93, 18.42], 10);


  myLayer = null;

  // search
  $('#company_search').on('submit', function(e) {
    e.preventDefault();

    fetchMarkers({
      onComplete: function(data) {
        // once the data has been fetched

        // clear all markers
        $('ul#info li').remove()

        // add markers from data (if there are any?)
        placeMarkers(myLayer, data);

        if (data.length > 0) {
          setTimeout( function() {
          map.fitBounds(myLayer.getBounds());
          }, 50);
          setTimeout( function() {
          $( "li.item" ).first().mouseover();
          }, 600);
        }
      },
      data: $('#company_search').serialize()
    });
  });

  var fetchMarkers = function(args) {
    $.ajax({
      type: "GET",
      data: args.data,
      url: "/companies",
      dataType: "json",
      success: args.onComplete
    });


  };

  var placeMarkers = function(layer, data) {

    layer.setGeoJSON(data);

    var info = document.getElementById('info');
    var info = $('ul#info')

    // Iterate through each feature layer item, build a
    // marker menu item and enable a click event that pans to + opens
    // a marker that's associated to the marker item.
    layer.eachLayer(function(marker) {

      itemName = marker.feature.properties.title +
        '' + marker.feature.properties.additional + '';

      itemMarker = marker.feature.properties.window +
        '' + marker.feature.properties.description + '';

      info.append(

        $("<li class='item'>" + itemName + "</li>").on('mouseover', function(e) {

          $('ul#info li').removeClass('active');
          $(e.target).addClass('active');

          // When a menu item is clicked, animate the map to center
          // its associated marker and open its popup.
          
          marker.openPopup();

        })
      );

      marker.bindPopup(itemMarker,{
        width: 320,
        height: 320
      }); 
    });
  };
  myLayer = L.mapbox.featureLayer().addTo(map);

  fetchMarkers({
    onComplete: function(data) {
      placeMarkers(myLayer, data);
      setTimeout( function() {
      map.fitBounds(myLayer.getBounds());
      }, 50);

    }
  });  
};

function filterButton(form) {
  fetchMarkers({
    onComplete: function(data) {
      // once the data has been fetched

      // clear all markers
      $('ul#info li').remove()

      // add markers from data (if there are any?)
      placeMarkers(myLayer, data);

      if (data.length > 0) {
        setTimeout( function() {
        map.fitBounds(myLayer.getBounds());
        }, 50);
        setTimeout( function() {
        $( "li.item" ).first().mouseover();
        }, 600);
      }
    },
    data: {q: {has_tags: $('#has_tags').val()}}
  });
};



var fetchMarkers = function(args) {
  $.ajax({
    type: "GET",
    data: args.data,
    url: "/companies",
    dataType: "json",
    success: args.onComplete
  });


};

var placeMarkers = function(layer, data) {

  layer.setGeoJSON(data);

  var info = document.getElementById('info');
  var info = $('ul#info')

  // Iterate through each feature layer item, build a
  // marker menu item and enable a click event that pans to + opens
  // a marker that's associated to the marker item.
  layer.eachLayer(function(marker) {

    itemName = marker.feature.properties.title +
      '' + marker.feature.properties.additional + '';

    itemMarker = marker.feature.properties.window +
      '' + marker.feature.properties.description + '';

    info.append(

      $("<li class='item'>" + itemName + "</li>").on('mouseover', function(e) {

        $('ul#info li').removeClass('active');
        $(e.target).addClass('active');

        // When a menu item is clicked, animate the map to center
        // its associated marker and open its popup.
        
        marker.openPopup();

      })
    );

    marker.bindPopup(itemMarker,{
      width: 320,
      height: 320
    }); 
  });
};
myLayer = L.mapbox.featureLayer().addTo(map);

fetchMarkers({
  onComplete: function(data) {
    placeMarkers(myLayer, data);
    setTimeout( function() {
    map.fitBounds(myLayer.getBounds());
    }, 50);

  }
});

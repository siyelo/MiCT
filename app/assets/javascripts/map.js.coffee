# SetupMap = ->
#   map = L.mapbox.map("map", "examples.h186knp8").setView([
#     -33.93
#     18.42
#   ], 10)
#   window.myLayer = null
  
#   # search
#   $("#company_search").on "submit", (e) ->
#     e.preventDefault()
#     fetchMarkers
#       onComplete: (data) ->
        
#         # once the data has been fetched
        
#         # clear all markers
#         $("ul#info li").remove()
        
#         # add markers from data (if there are any?)
#         placeMarkers myLayer, data
#         if data.length > 0
#           setTimeout (->
#             map.fitBounds myLayer.getBounds()
#             return
#           ), 50
#           setTimeout (->
#             $("li.item").first().mouseover()
#             return
#           ), 600
#         return

#       data: $("#company_search").serialize()

#     return

#   fetchMarkers = (args) ->
#     $.ajax
#       type: "GET"
#       data: args.data
#       url: "/companies"
#       dataType: "json"
#       success: args.onComplete

#     return

#   placeMarkers = (layer, data) ->
#     layer.setGeoJSON data
#     info = document.getElementById("info")
#     info = $("ul#info")
    
#     # Iterate through each feature layer item, build a
#     # marker menu item and enable a click event that pans to + opens
#     # a marker that's associated to the marker item.
#     layer.eachLayer (marker) ->
#       itemName = marker.feature.properties.title + "" + marker.feature.properties.additional + ""
#       itemMarker = marker.feature.properties.title + "" + marker.feature.properties.description + ""
#       info.append $("<li class='item'>" + itemName + "</li>").on("mouseover", (e) ->
#         $("ul#info li").removeClass "active"
#         $(e.target).addClass "active"
        
#         # When a menu item is clicked, animate the map to center
#         # its associated marker and open its popup.
#         marker.openPopup()
#         return
#       )
#       marker.bindPopup itemMarker,
#         width: 320
#         height: 320

#       return

#     return

#   myLayer = L.mapbox.featureLayer().addTo(map)
#   fetchMarkers onComplete: (data) ->
#     placeMarkers myLayer, data
#     setTimeout (->
#       map.fitBounds myLayer.getBounds()
#       return
#     ), 50
#     return

#   return
# filterButton = (form) ->
#   fetchMarkers
#     onComplete: (data) ->
      
#       # once the data has been fetched
      
#       # clear all markers
#       $("ul#info li").remove()
      
#       # add markers from data (if there are any?)
#       placeMarkers myLayer, data
#       if data.length > 0
#         setTimeout (->
#           map.fitBounds myLayer.getBounds()
#           return
#         ), 50
#         setTimeout (->
#           $("li.item").first().mouseover()
#           return
#         ), 600
#       return

#     data:
#       q:
#         has_tags: $("#has_tags").val()

#   return
# fetchMarkers = (args) ->
#   $.ajax
#     type: "GET"
#     data: args.data
#     url: "/companies"
#     dataType: "json"
#     success: args.onComplete

#   return

# placeMarkers = (layer, data) ->
#   layer.setGeoJSON data
#   info = document.getElementById("info")
#   info = $("ul#info")
  
#   # Iterate through each feature layer item, build a
#   # marker menu item and enable a click event that pans to + opens
#   # a marker that's associated to the marker item.
#   layer.eachLayer (marker) ->
#     itemName = marker.feature.properties.title + "" + marker.feature.properties.additional + ""
#     itemMarker = marker.feature.properties.title + "" + marker.feature.properties.description + ""
#     info.append $("<li class='item'>" + itemName + "</li>").on("mouseover", (e) ->
#       $("ul#info li").removeClass "active"
#       $(e.target).addClass "active"
      
#       # When a menu item is clicked, animate the map to center
#       # its associated marker and open its popup.
#       marker.openPopup()
#       return
#     )
#     marker.bindPopup itemMarker,
#       width: 320
#       height: 320

#     return

#   return

# window.myLayer = L.mapbox.featureLayer().addTo(map)
# fetchMarkers onComplete: (data) ->
#   placeMarkers myLayer, data
#   setTimeout (->
#     map.fitBounds myLayer.getBounds()
#     return
#   ), 50
#   return

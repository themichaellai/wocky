# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(() ->
  $('#searchf').submit(() ->
    url = 'http://ws.spotify.com/search/1/track.json?q=' + $('#q').val()
    $.ajax({
      url: url,
      dataType: 'json',
      success: (json) ->
        track_names = json['tracks'][0..5].map( (track) ->
          artist_names = track['artists'].map( (artist_dat) ->
            artist_dat['name']
          ).join(', ')
          track['name']  + ' - ' + artist_names
        ).join('<br />')
        $('#results').html(track_names)
        return
      error: (json) ->
        $('#results').replaceWIth('Error!')
        return
      }
    )
  )
)

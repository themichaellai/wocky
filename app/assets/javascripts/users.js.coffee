prettyArtists = (artist_array) ->
  return artist_array.map( (artist_dat) ->
    artist_dat['name']
  ).join(', ')

$(document).ready(() ->
  $('#searchf').submit(() ->
    url = 'http://ws.spotify.com/search/1/track.json?q=' + $('#q').val()
    $.ajax({
      url: url,
      dataType: 'json',
      success: (json) ->
        name_fields = $('.name_field')
        artist_fields = $('.artist_field')
        spotify_uri_fields = $('.spotify_uri_field')
        buttons = $('.track-submit')
        tracks = json['tracks']

        # Need this, because sometimes results do not exceed 5 (surprisingly)
        display_num = if tracks.length >= 5 then 5 else tracks.length
        for i in [0...display_num]
          artists = prettyArtists(tracks[i]['artists'])

          artist_fields[i].value = artists
          name_fields[i].value = tracks[i]['name']
          buttons[i].value = tracks[i]['name'] + ' - ' + artists
          spotify_uri_fields[i].value = tracks[i]['href']

        # Show / hide buttons that are active / inactive
        $('.track-submit').slice(0, display_num).removeClass('hidden')
        $('.track-submit').slice(display_num, 5).addClass('hidden')

        return
      error: (json) ->
        $('#results').replaceWith('Error!')
        return
      }
    )
  )
)

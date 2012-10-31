# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#artist_genre_ids').chosen()

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.controls').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(".blackout-dates input[type='text']").live 'click', (event) ->
    if (!$(this).hasClass('hasDatepicker'))
        $(this).datepicker(
          dateFormat: 'yy-mm-dd'
        ).datepicker( "show" )

  $('#on_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#in_genres').chosen()

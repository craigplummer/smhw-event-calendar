$(document).ready(function(){
  $('#events_calendar').fullCalendar({
    events: 'events.json',
    defaultView: 'basicWeek'
  });

  $('#new_event_link').click(function(){
    $('#new_event').show();
  });

  $('#new_event').on('ajax:error', function(event, xhr, status, error) {
    $('#event_form_errors').html('');
    errors = JSON.parse(xhr.responseText).errors;
    $.each(errors, function(index, value) {
      $('#event_form_errors').append('<li>' + value + '</li>');
    })
  });

  $('#new_event').on('ajax:success', function(event, data, status, xhr) {
    $('#event_form_errors').html('');
    $(this).trigger('reset');
    $('#events_calendar').fullCalendar('renderEvent', data);
  });
});


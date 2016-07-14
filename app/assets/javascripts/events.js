$(document).ready(function(){
  $('#events_calendar').fullCalendar({
    events: 'events.json',
    defaultView: 'basicWeek'
  });
});

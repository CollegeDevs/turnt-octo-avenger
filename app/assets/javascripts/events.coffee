# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
	$ ->
		$('.calendar1').fullCalendar(
	    header: {
	      left: 'title',
	      center: 'prev,today,agendaDay,agendaWeek,month,next',
	      right: ''
	    },

	    defaultView: 'month',
	    height: 300,
	    editable: true,
	    resizable: true,

	    events: '/projects.json',
			color: 'red'
			)

		$('.calendar3').fullCalendar(
	    header: {
	      left: 'prev,next',
	      center: 'title',
	      right: 'today,agendaDay,agendaWeek,month'

	    },

	    defaultView: 'month',
	    height: 600,
	    editable: true,
	    resizable: true,

	    events: '/projects.json',
			color: 'red'
			)

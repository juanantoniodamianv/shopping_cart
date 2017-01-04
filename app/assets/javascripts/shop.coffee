$(document).om 'click', 'form.add_fields', (event)->
time = new Date().getTime()
regexp = new RegExp($(this).data('id'),'g')
$(this).before($(this).data('galleries').replace(regexp, time))
event.preventDefault()


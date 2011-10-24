$(document).ready ->

  interval = ''

  $('#new_task_box .start_button').click ->
    $(this).toggleClass('started')
    if $(this).hasClass('started')
      $(this).text('Stop')
    else
      $(this).text('Start')

  $('#old_tasks_list tr').click ->
    box = $('<tr class="edit_box"></tr>')
    box.append($('#edit_task_box form').clone())
    # interval = setInterval(check_box, 5)
    $(this).before(box)
    $(this).hide()

  # check_box = () ->
  #   if ($('.edit_box form').length != 0)
  #     clearInterval(interval)
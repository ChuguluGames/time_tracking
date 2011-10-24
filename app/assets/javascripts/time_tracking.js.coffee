$(document).ready ->

  formatDuration = (duration) ->
    format = 'hh:mm:ss'
    result = ''

    if (result = duration.match(/^([\d]{1,2}) sec$/))
      return Date.today().set({hour: 0, minute: 0, second: parseInt(result[1])}).toString(format)
    else if (result = duration.match(/^([\d]{1,2})(:([\d]{1,2}))? min$/))
      return Date.today().set({hour: 0, minute: parseInt(result[1]), second: parseInt(result[3])}).toString(format)
    else if (result = duration.match(/^([\d]{1,2}):([\d]{1,2}):([\d]{1,2})$/))
      return Date.today().set({hour: parseInt(result[1]), minute: parseInt(result[2]), second: parseInt(result[3])}).toString(format)

    return '00:00:00'


  openTask = (task) ->
    # box = $('<tr class="edit_box"><td colspan="3"><div class="close_task"></div></td></tr>')
    box = $('<tr class="edit_box"><td colspan="3"></td></tr>')
    original_box = $('#edit_task_box form')
    original_box.find('#name')[0].value = task.find('.name').text()
    original_box.find('#duration')[0].value = formatDuration(task.find('.duration').text())
    original_box.find('#project')[0].value = task.find('.project').text()
    original_box.find('#begin_at')[0].value = ''
    original_box.find('#end_at')[0].value = ''

    closeAllOpenTask()
    # box.find('.close_task').click ->
    #   closeTask(task)

    box.find('td').append(original_box.clone())
    task.before(box)
    task.hide()
    console.log(task)

  closeTask = (task) ->
    $('#old_tasks_list .edit_box').remove()
    task.show()

  closeAllOpenTask = () ->
    $('#old_tasks_list .edit_box').remove()
    $('#old_tasks_list .task:hidden').show()

  $('#new_task_box .start_button').click ->
    $(this).toggleClass('started')
    if $(this).hasClass('started')
      $(this).text('Stop')
    else
      $(this).text('Start')

  $('#old_tasks_list .task').click ->
    openTask($(this))
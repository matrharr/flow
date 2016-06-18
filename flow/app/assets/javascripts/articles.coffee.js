$(document).ready(function(){
  $('#new_article_link').on('click', showForm)
  $('#new_article_container').on('submit', '#new_article', submitForm)
})

var showForm = function(e){
  e.preventDefault()
  var that = $(this)
  var url = that.attr('href')

  if(that.hasClass('open')){
    that.next().remove()
    that.toggleClass('open')
    that.html('<p>Write a new post</p>')
  }else{
    that.html('<p>Close</p>')
    that.toggleClass('open')
    $.ajax({
      url: url,
      method: 'GET'
    }).done(function(response){
      that.after(response)
    })
  }
}

var submitForm = function(e){
  e.preventDefault()
  var that = $(this)
  var data = that.serialize()
  var url = that.attr('action')
  $.ajax({
    url: url,
    data: data,
    method: 'POST'
  }).done(function(response){
    that.parent().after(response)
    that.parent().remove()
    $('#new_article_link').html('<p>Write a new post</p>')

  })
}

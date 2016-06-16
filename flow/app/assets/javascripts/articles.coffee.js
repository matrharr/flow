$(document).ready(function(){
  console.log("here")
  $('#new_article').on('click', doThing)
})

var doThing = function(e){
  e.preventDefault()
  var that = $(this)
  var url = that.attr('href')
  // fix condition
  that.toggleClass('open')
  if(that.hasClass('open')){
    that.next().next().remove()
    that.next().remove
  }else{
    $.ajax({
      url: url,
      method: 'GET'
    }).done(function(response){
      that.after(response)
    })
  }
 }
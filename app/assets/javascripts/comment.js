$(function(){
  function buildHTML(comment){
    let html = `<div class="comment-box">
                  <p class="username">${comment.user_name}</p>
                  <p class="text">${comment.text}</p>
                </div>`
    return html;
  }
  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comment-show').append(html);
      $('.textbox').val('');
      $('.form-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})
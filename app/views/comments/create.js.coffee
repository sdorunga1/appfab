form = $('form#new_comment')

<% if @comment.new_record? %>

$(form).replaceWith '<%=j render("form", comment:@comment) %>'

<% else %>

$(form).after '<%=j render(@comment) %>'
$(form).replaceWith '<%=j render("form", comment:@comment.idea.comments.new) %>'

comment = $('#comment_<%= @comment.id %>')
comment.flash
  start:'af-pop'
comment.activateUnobtrusiveJavascript()

<% end %>

$(form).activateUnobtrusiveJavascript()

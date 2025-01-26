#!/bin/sh
echo '<div id="login_form" class="body_blank">'
  echo '<div class="the_box" style="width:max-content;margin-left:auto;margin-right:auto;margin-top:20vh;">'
    echo '<form action="/login:handler" method="POST">'
      bf_widget Title "Login"
      echo "<p>$(bf_widget Textbox "email" --placeholder "Email Address")</p>"
      echo "<p>$(bf_widget Textbox "password" --placeholder "Password" --type password)</p>"
      echo "<p>$(bf_widget Button --innertext "Login")</p>"
    echo "</form>"
  echo '</div>'
echo '</div>'

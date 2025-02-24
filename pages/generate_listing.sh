#!/bin/sh
echo "Content-Type: text/html;charset=UTF-8"
echo
echo "<!DOCTYPE html>"
echo "<html>"
  echo "<head><style>$(python pages/css.py)</style><title>Directory listing of ${HTTP_PATH}</title></head>"
  echo "<body class=\"body_blank\">"
    echo '<p style="position:absolute;top:0px;right:15px;">'
      if [[ ${USERNAME} == 'Guest' ]]; then
        bf_widget Widget a "Not logged in" --onclick "show_login_form()"
      else
        bf_widget Link "Logged in as ${USERNAME}" "/login:handler"
      fi
    echo '</p>'
    bf_widget Title "Directory listing for ${HTTP_PATH}"
    echo "<ul>"
      for file in ${CWD}/*; do
        if [[ -d "$file" ]]; then
          file_name=$(basename "$file")
          file_path="${HTTP_PATH}${file_name}/"
          file_path="${file_path//\//}/"
          echo "<li><a href=\"${file_path}\">${file_name}/</a></li>"
        else
          file_name=$(basename "$file")
          file_path="${HTTP_PATH}${file_name}"
          echo "<li><a href=\"${file_path}\">${file_name}</a></li>"
        fi
      done
    echo "</ul>"
    if [ -f $CWD/index.txt ]; then
      echo '<div class="the_box" style="width:calc( 100vw - 50px ); padding-top:10px; padding-bottom:10px; font-family:monospace;">'
      CONTENT=$(sed -e 's/&/\&amp;/g' \
                    -e 's/</\&lt;/g' \
                    -e 's/>/\&gt;/g' \
                    -e 's/"/\&quot;/g' \
                    -e 's/'"'"'/\&#39;/g' \
                    -e ':a;N;$!ba;s/\n/<br\/>/g' $CWD/index.txt)
      echo "${CONTENT//$'\n'/<br />}"
      echo '</div>'
    fi
  echo "</body>"
  pages/login_form.sh
  bf_widget Widget script --innertext "$(cat pages/index.js)"
echo "</html>"

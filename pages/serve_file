#!/bin/sh
CONTENT_TYPE=$(file --mime-type -b ${CWD})
if [[ $CONTENT_TYPE == "text/plain" ]]; then
  ACCEPT=$(grep 'Header.Accept:' .request | awk '{print $2}')
  for value in ${ACCEPT//,/ }; do
    if [[ ${value} = "text/html" ]]; then
      echo "Content-Type: text/html;charset=UTF-8"
      echo
      echo "<!DOCTYPE html>"
      echo "<html>"
        echo "<head><style>$(python pages/css.py)</style><title>Directory listing of ${HTTP_PATH}</title></head>"
        echo '<body class="body_blank" style="font-family:monospace">'
          CONTENT=$(sed -e 's/&/\&amp;/g' \
                        -e 's/</\&lt;/g' \
                        -e 's/>/\&gt;/g' \
                        -e 's/"/\&quot;/g' \
                        -e 's/'"'"'/\&#39;/g' \
                        -e ':a;N;$!ba;s/\n/<br\/>/g' $CWD)
          echo "${CONTENT//$'\n'/<br />}"
        echo "</body>"
      echo "</html>"
      exit
    fi
  done
fi
echo "Content-Type: ${CONTENT_TYPE}"
echo ""
cat $CWD

#!/bin/bash

SLACK_PATH='/Applications/Slack.app/Contents/Resources'
CSS_URL='https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css'

sudo bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/ssb-interop.js" << EOF
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: '${CSS_URL}',
   success: function(css) {
     \$("<style></style>").appendTo('head').html(css);
   }
 });
});
EOF

sudo bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/index.js" << EOF
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: '${CSS_URL}',
   success: function(css) {
     \$("<style></style>").appendTo('head').html(css);
   }
 });
});
EOF

sudo bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/ssb-interop.js" << EOF
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: '${CSS_URL}',
   success: function(css) {
     css += \`
       div.c-virtual_list__scroll_container {
           background-color: #222222 !important;
       }
       .p-message_pane .c-message_list:not(.c-virtual_list--scrollbar), .p-message_pane .c-message_list.c-virtual_list--scrollbar > .c-scrollbar__hider {
            z-index: 0;
       }
       div.c-message__content:hover {
           background-color: #222222 !important;
       }

       div.c-message:hover {
           background-color: #222222 !important;
       }
     \`;
     \$("<style></style>").appendTo('head').html(css);
   }
 });
});
EOF
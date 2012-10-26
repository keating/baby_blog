# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require ckeditor/init

# 隐藏提示框方法
window.msg_hide = ->
  setTimeout ->
    $("#message").slideUp('slow')
  , 5000

window.Baby = {}
window.Baby.prototype = {}

$ ->
    # ie6
    if $.browser.msie && $.browser.version == 6.0
        $('.content').css('margin-top', '10px')

    msg_hide() # 隐藏提示框，需要使用括号才能调用

#= require_tree .



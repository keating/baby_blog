# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  title_msg = "请输入标题"
  # 点击
  $("#article-title").live "click", ->
    this.value = "" if this.value == title_msg
  # 失去焦点
  $("#article-title").live "blur", ->
    this.value = title_msg if this.value == ""
  # 提交文章
  $("#article-submit").live "click", ->
    if $("#article-title").val() == title_msg
      $("#message").html("这标题太惹眼...")
      $("#message").show()
      msg_hide()
      return false
    $("form").submit



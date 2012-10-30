#encoding: utf-8
module ApplicationHelper

  def devise_error_messages_new!
    return "" if resource.errors.empty?

    msg_detail = resource.errors.full_messages.inject("") {|result, msg| result << "<li>* #{msg}</li>"}

    html = <<-HTML
    <div id="error_explanation">
      <div class="alert alert-error">
        有 #{ resource.errors.count } 处问题导出操作失败:
      </div>

      <ul>
        #{msg_detail}
      </ul>
    </div>
    HTML

    html.html_safe
  end

end

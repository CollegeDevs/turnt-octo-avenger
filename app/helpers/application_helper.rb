module ApplicationHelper
  def markdownify(content)
      filter_context = { gfm: true, asset_root: "/images"}
      filter = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::EmojiFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::ImageMaxWidthFilter,
      ], filter_context
      filter.call(content)[:output].to_s.html_safe
    end
end

require 'open-uri'

class PagesController < ApplicationController
  def index
    @pages = Page.all

    render json: @pages
  end

  def create
    html = Nokogiri::HTML(open(page_params[:url]))
    h1_content = get_content_in_css(html, 'h1')
    h2_content = get_content_in_css(html, 'h2')
    h3_content = get_content_in_css(html, 'h3')
    links = get_links(html)

    @page = Page.create({
      url: page_params[:url],
      h1_content: h1_content,
      h2_content: h2_content,
      h3_content: h3_content,
      links: links
    })
    render json: @page, status: :created
  end

  private

  def get_content_in_css(html, tag)
    html.css(tag).children.to_a.map(&:to_s)
  end

  def get_links(html)
    html.css('a').map { |el| el.attribute('href').value }
  end

  def page_params
    params.require(:data).require(:attributes).permit(:url)
  end
end

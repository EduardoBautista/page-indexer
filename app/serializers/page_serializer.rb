class PageSerializer < ActiveModel::Serializer
  attributes :id, :url, :h1_content, :h2_content, :h3_content, :links
end

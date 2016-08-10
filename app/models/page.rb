class Page < ApplicationRecord
  serialize :h1_content, Array
  serialize :h2_content, Array
  serialize :h3_content, Array
  serialize :links, Array
end

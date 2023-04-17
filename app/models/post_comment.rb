# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_ancestry
  scope :main_comments, -> { where(parent_comment_id: nil) }
  scope :child_comments, -> { where.not(parent_comment_id: nil).group_by(&:parent_comment_id) }
end

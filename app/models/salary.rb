# == Schema Information
#
# Table name: salaries
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  equity     :boolean          default(FALSE)
#  flex       :integer
#  graduation :datetime
#  overtime   :integer
#  remote     :integer
#  role_name  :string
#  workweek   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Salary < ApplicationRecord
  ROLES = [
    'Backend Developer', 'Frontend Developer', 'Fullstack Developer', 'Product Manager',
    'Project Manager', 'QA Engineer', 'UI/UX Designer'
  ].freeze

  enum remote: { fully_remote: 0, partial_remote: 1, no_or_limited_remote: 2 }
  enum flex:   { full_flex: 0, with_core_time: 1, no_flexible_hours: 2 }

  validates :amount, :graduation, :role_name, presence: true
  validates :amount, numericality: { greater_than: 2_000_000, message: 'Are you sure your yearly salary was so low?' }
  validates :overtime, :workweek, numericality: { allow_nil: true }
end

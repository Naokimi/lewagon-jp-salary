# == Schema Information
#
# Table name: salaries
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  equity     :boolean
#  flex       :integer
#  job_title  :string
#  overtime   :integer
#  remote     :integer
#  workweek   :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Salary < ApplicationRecord
  ROLES = [
    'Backend Developer', 'Frontend Developer', 'Fullstack Developer', 'Product Manager',
    'Project Manager', 'QA Engineer', 'UI/UX Designer',
    'Support Engineer', 'Tech consultant',
    'Data Scientist', 'Data Analyst', 'AI Engineer'
  ].freeze

  enum remote: { none_or_limited_remote: 0, partial_remote: 1, fully_remote: 2 }
  enum flex:   { no_flexible_hours: 0, with_core_time: 1, full_flex: 2 }

  validates :amount, :year, :job_title, presence: true
  validates :year, numericality: { greater_than: 2016, less_than_or_equal_to: Time.zone.now.year }
  validates :amount, numericality: { greater_than: 2_000_000, message: 'Are you sure your yearly salary was so low?' }
  validates :overtime, :workweek, numericality: { allow_nil: true }
end

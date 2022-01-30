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

  enum remote: { remote: 0, occasionaly: 1, office: 2 }
  enum flex:   { fullflex: 0, core_time: 1, set_hours: 2 }

  validates :amount, :graduation, :role_name, presence: true
  validates :amount, numericality: { greater_than: 2_000_000, error: 'Are you sure your yearly salary was so low?' }
  validates :overtime, :workweek, numericality: true # allow for nil
end

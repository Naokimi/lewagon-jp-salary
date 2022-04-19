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
  WEB_DEV_DEVELOPER_ROLES    = ['Backend Developer', 'Frontend Developer', 'Fullstack Developer'].freeze
  WEB_DEV_NON_DEV_ROLES      = ['Product Manager', 'Project Manager', 'QA Engineer', 'UI/UX Designer', 'Support Engineer', 'Tech consultant'].freeze
  DATA_SCIENCE_DEV_ROLES     = ['AI Engineer'].freeze
  DATA_SCIENCE_NON_DEV_ROLES = ['Data Scientist', 'Data Analyst'].freeze

  enum remote: { none_or_limited_remote: 0, partial_remote: 1, fully_remote: 2 }
  enum flex:   { no_flexible_hours: 0, with_core_time: 1, full_flex: 2 }

  validates :amount, :year, :job_title, presence: true
  validates :year, numericality: { greater_than: 2016, less_than_or_equal_to: Time.zone.now.year }
  validates :amount, numericality: { greater_than: 2_000_000, message: 'Are you sure your yearly salary was so low?' }
  validates :overtime, :workweek, numericality: { allow_nil: true }

  def self.all_roles
    WEB_DEV_DEVELOPER_ROLES + WEB_DEV_NON_DEV_ROLES + DATA_SCIENCE_DEV_ROLES + DATA_SCIENCE_NON_DEV_ROLES
  end

  def self.web_dev_roles
    WEB_DEV_DEVELOPER_ROLES + WEB_DEV_NON_DEV_ROLES
  end

  def self.data_science_roles
    DATA_SCIENCE_DEV_ROLES + DATA_SCIENCE_NON_DEV_ROLES
  end

  def self.developer_roles
    WEB_DEV_DEVELOPER_ROLES + DATA_SCIENCE_DEV_ROLES
  end

  def self.non_developer_roles
    WEB_DEV_NON_DEV_ROLES + DATA_SCIENCE_NON_DEV_ROLES
  end
end

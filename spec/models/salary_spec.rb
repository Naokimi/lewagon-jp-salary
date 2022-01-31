# == Schema Information
#
# Table name: salaries
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  equity     :boolean          default(FALSE)
#  flex       :integer
#  job_title  :string
#  overtime   :integer
#  remote     :integer
#  workweek   :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Salary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

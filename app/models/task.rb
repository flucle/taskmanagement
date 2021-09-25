class Task < ApplicationRecord
  has_many :fix_tasks
  accepts_nested_attributes_for :fix_tasks
  validates :department, presence: true
  validates :occupation, presence: true
  validates :company_name, presence: true
  validates_associated :fix_tasks
end

class Project < ApplicationRecord
  include Sizeable

  #START: Adding associations
  has_many :roles, dependent: :destroy
  has_many :users, through: :roles
  #END: Adding associations

  has_many :tasks, -> { order "project_order ASC" },
    dependent: :destroy, inverse_of: :project

  validates :name, presence: true

  def self.all_public
    where(public: true)
  end

  def self.velocity_length_in_days
    21
  end

  def incomplete_tasks
    tasks.reject(&:complete?)
  end

  def done?
    incomplete_tasks.empty?
  end

  def size
    tasks.sum(&:size)
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end

  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / Project.velocity_length_in_days
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.infinite?    
    return false if projected_days_remaining.nan?    
    (Time.zone.today + projected_days_remaining) <= due_date  
  end

  # #START: next_task_order
  def next_task_order
    return 1 if tasks.empty?
    (tasks.last.project_order || tasks.size) + 1
  end
  # #END: next_task_order

  def add_users(users)
    self.users << users
  end
end

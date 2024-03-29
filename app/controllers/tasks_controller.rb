class TasksController < ApplicationController
  def new
    @task = Task.new
    @fix_tasks = @task.fix_tasks.build
  end

  def create
    @task =Task.new(task_params)
    incomplete_task = []
    complete_task = []
    @task.fix_tasks.each do |t|
      incomplete_task << t if (t.job_description.present? && t.period.empty?) || (t.job_description.empty? && t.period.present?)
      complete_task << t if t.job_description.present? && t.period.present?
    end

    if incomplete_task.empty? && complete_task.present? && @task.department.present? &&  @task.occupation.present? && @task.company_name.present?
      @task.fix_tasks.map {|t| t.save if t.job_description.present? && t.task.department.present? && t.task.occupation.present? && t.task.company_name.present? && t.period.present?}
      @task.fix_tasks.map{|t| t.destroy if t.job_description.empty? && t.period.empty?}
      redirect_to complete_tasks_path
    else
      @alert = "必須項目を入力してください"
      render(:new)
    end
  end

  def complete; end

  private
  def task_params
    params.require(:task).permit(:department, :grade, :occupation, :company_name, fix_tasks_attributes: [:id, :period, :job_description])
  end
end

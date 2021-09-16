class FixTasksController < ApplicationController
  def index
    @fix_tasks = FixTask.page(params[:page]).per(20).order('updated_at DESC')
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "tasks.csv", type: :csv
      end
    end
  end
end

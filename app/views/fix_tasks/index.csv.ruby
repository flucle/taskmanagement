require 'csv'

bom = "\xFF\xFE".force_encoding('UTF-16LE')
data = CSV.generate(col_sep: "\t") do |csv|
  column_names = %w(id 会社名 部門 等級 職種 周期 仕事内容)
  csv << column_names
  @fix_tasks.each do |task|
    column_values = [
      task&.id,
      task&.task&.company_name,
      task&.task&.department,
      task&.task&.grade,
      task&.task&.occupation,
      task&.period,
      task&.job_description
    ]
    csv << column_values
  end
end

bom.concat data.encode('UTF-16LE', undef: :replace, invalid: :replace, replace: '?', crlf_newline: true)
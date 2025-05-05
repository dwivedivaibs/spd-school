ActiveAdmin.register TcEntry do
  permit_params(*TcEntry.column_names.map(&:to_sym)) # Permits all DB columns

  index do
    selectable_column
    id_column
    column :tc_number
    column :student_name
    column :father_name
    column :mother_name
    column :nationality
    column :sc_st_obc
    column :dob
    column :subjects
    column :result
    column :last_class
    column :last_class_result
    column :qualified_for_promotion
    column :dues_paid
    column :ncc_cadets
    column :last_day_school
    column :leaving_reason
    column :total_meeting_attendance
    column :total_attendance
    column :general_conduct
    column :category
    column :certificate_issue_date
    column :created_at
    column :updated_at
    column :file
    actions
  end

  form do |f|
    f.inputs do
      date_fields = [:dob, :last_day_school, :certificate_issue_date]
      excluded_fields = [:id, :created_at, :updated_at]

      TcEntry.column_names.map(&:to_sym).each do |field|
        next if excluded_fields.include?(field)

        placeholder_text = "Enter #{field.to_s.humanize}"

        if date_fields.include?(field)
          f.input field,
                  as: :datepicker,
                  datepicker_options: {
                    year_range: "1950:#{Time.current.year}",
                    max_date: "+0D"
                  },
                  input_html: { placeholder: placeholder_text }
        else
          f.input field, input_html: { placeholder: placeholder_text }
        end
      end
    end
    f.actions
  end
end

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
      TcEntry.column_names.map(&:to_sym).each do |field|
        next if [:created_at, :updated_at].include?(field)

        if field == :dob
          f.input :dob, as: :datepicker, datepicker_options: { year_range: "1950:#{Time.current.year}", max_date: "+0D" }
        else
          f.input field
        end
      end
    end
    f.actions
  end

end

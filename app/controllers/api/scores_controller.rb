require "csv"

class Api::ScoresController < ApplicationController
  def import
    file = params[:file]
    if file.present?
      begin
        Score.delete_all
        csv_to_db_column = {
          "sbd" => "reg_num",
          "toan" => "math",
          "ngu_van" => "literature",
          "ngoai_ngu" => "f_language",
          "vat_li" => "physic",
          "hoa_hoc" => "chem",
          "sinh_hoc" => "biology",
          "lich_su" => "history",
          "dia_li" => "geo",
          "gdcd" => "ce",
          "ma_ngoai_ngu" => "f_language_id"
        }

        CSV.foreach(file.path, headers: true) do |row|
          original_data = row.to_hash
          mapped_data = {}

          csv_to_db_column.each do |csv_col, db_col|
            value = original_data[csv_col]
            mapped_data[db_col] = value.present? ? value : 13
          end

          Score.create!(mapped_data)
        end

        render json: { message: "Success" }, status: :ok
      rescue => e
        render json: { error: "Failed: #{e.message}" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Missing file" }, status: :bad_request
    end
  end

  def show
    score = Score.find_by(reg_num: params[:regNum])
    if score
        render json: score.slice(:reg_num, :math, :literature, :f_language, :physic, :chem, :biology, :history, :geo, :ce, :f_language_id), status: :ok
    else
        render json: { error: "Not found" }, status: :not_found
    end
  end

  def show_top
    group = params[:groupName] || "A"
    # limit = params[:limit]&.to_i || 10
    result = Score.top_by_group(group, 10)
    # result[:group_score] = subjects.map { |s| result[:group_score].round(2) }
    render json: result.as_json(except: [ :id, :created_at, :updated_at ])
  end
end

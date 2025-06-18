class Api::StatsController < ApplicationController
  def score_stat
    subject = params[:sub]
    stat = {
      lv1: Score.where("#{subject} < ?", 4).count,
      lv2: Score.where("#{subject} >= ? AND #{subject} < ?", 4, 6).count,
      lv3: Score.where("#{subject} >= ? AND #{subject} < ?", 6, 8).count,
      lv4: Score.where("#{subject} >= ? AND #{subject} < ?", 8, 13).count
    }

    render json: stat
  end

  def all_score_stat
    subjects = [ :math, :literature, :physic, :chem, :biology, :history, :geo, :ce, :f_language ]
    stat = {}
    subjects.each do |subject|
      stat[subject] = {
        lv1: Score.where("#{subject} < ?", 4).count,
        lv2: Score.where("#{subject} >= ? AND #{subject} < ?", 4, 6).count,
        lv3: Score.where("#{subject} >= ? AND #{subject} < ?", 6, 8).count,
        lv4: Score.where("#{subject} >= ? AND #{subject} < ?", 8, 13).count
      }
  end
    render json: stat
  end
end

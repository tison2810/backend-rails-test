class Score < ApplicationRecord
  GROUPS = {
    "A" => [ :math, :physic, :chem ],
    "B" => [ :math, :chem, :biology ],
    "A1" => [ :math, :physic, :f_language ]
}.freeze
  def self.top_by_group(group, limit = 10)
    subjects = GROUPS[group]
    conditions = subjects.map { |s| Score.arel_table[s].not_eq(13) }

    group_score = subjects.map { |s| "CAST(#{s} AS numeric)" }.join(" + ")
    query = select("*, ROUND(#{group_score}, 2) AS group_score")
            .where(conditions.inject(:and))
            .order("group_score DESC")
            .limit(limit)
    query = query.where(f_language_id: "N1") if group == "A1"

    query
  end
end

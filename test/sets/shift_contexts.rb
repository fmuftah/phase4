module Contexts
  module ShiftContexts

    def create_shifts
      @ed_shift1      = FactoryBot.create(:shift, assignment: @assign_ed)
      @ed_shift2      = FactoryBot.create(:shift, assignment: @assign_ed, date: 1.day.from_now.to_date)
      @ben_shift1     = FactoryBot.create(:shift, assignment: @promote_ben)
      @ben_shift2     = FactoryBot.create(:shift, assignment: @promote_ben, date: 1.day.from_now.to_date)
      @kathryn_shift1 = FactoryBot.create(:shift, assignment: @assign_kathryn)
      @kathryn_shift2   = FactoryBot.create(:shift, assignment: @assign_kathryn, date: 6.months.ago.to_date)
      @ed_past_shift1 = FactoryBot.create(:shift, assignment: @assign_ed, date: 1.week.from_now.to_date)
      @ed_past_shift1.update_attribute(:date, 1.day.ago.to_date)
      
    end

    def remove_shifts
      @ed_shift1.destroy     
      @ed_shift2.destroy
      @ben_shift1.destroy
      @ben_shift2.destroy
      @kathryn_shift1.destroy
      @kathryn_shift2.destroy
    end

  end
end

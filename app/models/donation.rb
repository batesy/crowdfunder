class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  	def self.price_in_cents(project)
  		project.donations.sum {|f| f.amount}
  	end

    def self.formatted_amount(price_in_cents)
  		amount_in_dollars = price_in_cents.to_f / 100
  		sprintf( "%.2f", amount_in_dollars)
  	end
end

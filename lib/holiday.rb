require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_supplies = []
  holiday_hash[:winter].each do |each_holiday_array|
    all_supplies << each_holiday_array
  end
  all_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season_name, season_data|
    puts "#{season_name.to_s.capitalize}:"
    season_data.each do |holiday, holiday_supplies_array|
      holiday_name = holiday.to_s
      if holiday_name.include?("_")
        split_hol = holiday_name.split('_')
        split_hol.collect do |each_word|
          each_word.capitalize!
        end
        holiday_name = split_hol.join(" ")
      else
        holiday_name.capitalize!
      end
      holiday_supplies_string = holiday_supplies_array.join(", ")
      puts "  #{holiday_name}: #{holiday_supplies_string}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_hol_names_array = []
  holiday_hash.each do |season_name, season_hash|
    season_hash.each do |holiday, holiday_supplies_array|
      holiday_supplies_array.each do |supply_name|
        if supply_name.include?("BBQ")
          return_hol_names_array << holiday
        end
      end
    end
  end
  return_hol_names_array
end

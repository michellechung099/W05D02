# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)
  select
    DISTINCT continent
  from 
    countries;
  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
  select
    SUM(gdp) AS total_gdp
  from
    countries
  where
    continent='Africa';
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
  select
    COUNT(name) AS counter
  from
    countries
  where
    area > 1000000;
  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)
  select
    SUM(population) AS total_pop
  from
    countries
  where
    name IN ('France','Germany','Spain');
  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
  select
    continent, COUNT(*) AS num_countries
  from
    countries
  group by
    continent;
  SQL
end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
  select
    continent, COUNT(*)
  from  
    countries
  where
    population >= 10000000
  group by
    continent;
  SQL
end

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
  SQL
end

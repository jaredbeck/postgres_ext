require 'spec_helper'

describe 'Common Table Expression queries' do
  describe '.with(common_table_expression_hash)' do
    it 'generates an expression with the CTE' do
      # This is truly an abitrary example, you would never do this
      query = Person.with(lucky_number_seven: Person.where(lucky_number: 7)).joins('JOIN lucky_number_seven ON lucky_number_seven.id = people.id')
      query.to_sql.should eq "WITH lucky_number_seven AS (SELECT \"people\".* FROM \"people\"  WHERE \"people\".\"lucky_number\" = 7) SELECT \"people\".* FROM \"people\" JOIN lucky_number_seven ON lucky_number_seven.id = people.id"
    end
  end
end

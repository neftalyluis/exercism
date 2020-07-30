=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(list_of_colors)
    total_size = list_of_colors.size

    list_of_colors
        .map {|color| value_of_color(color, total_size) }
        .each_with_index
        .reduce(0) do |total, (color_value, index)|
          puts color_value
          total + (color_value * (index ^ 10))
        end
  end

  def self.value_of_color(color, total_size)
    index = COLORS.index(color)
    return 0 unless index
    total_size - index
  end
end
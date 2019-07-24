class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @elements << build_element(row)
    end
    @elements.empty? ? @next_id = 1 : @next_id = @elements.last.id + 1
  end
end


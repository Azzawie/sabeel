class HomeController < ApplicationController
  require 'csv'

  def index; end

  ##
  # This function generates a CSV file of Chamber data, sends it as a file download, and schedules the
  # temporary file for deletion after a specific time.
  def generate_csv
    file = Tempfile.new('temp_file', "#{Rails.root}/tmp")

    chambers = Chamber.order(:name)
    headers = %w[ID Name Description]
    CSV.open(file, 'w', write_headers: true, headers:) do |writer|
      chambers.each do |chamber|
        writer << [chamber.id, chamber.name, chamber.description]
      end
    end
    send_file file, filename: 'nextnext.csv', type: 'application/csv', disposition: 'attachment'

    # Schedule the temporary file for deletion after a specific time
    delay = 5.minutes # Change this to the desired time interval
    DeleteTemporaryFileJob.set(wait: delay).perform_later(file.path)
  end

  def generate_pdf
    # pdf = Prawn::Document.new
    # pdf.text 'Hello, World!'

    # temp_pdf_path = Rails.root.join('tmp', 'filwe.pdf')
    # pdf.render_file(temp_pdf_path)

    # send_file temp_pdf_path, filename: 'file.pdf', type: 'application/pdf', disposition: 'attachment'
  end
end

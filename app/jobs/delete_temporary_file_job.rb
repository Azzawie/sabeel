class DeleteTemporaryFileJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    # Implement the logic to delete the temporary file
    File.delete(file_path) if File.exist?(file_path)
  end
end

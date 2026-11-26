class CreateActivityTool < RubyLLM::Tool
  description "Returns an activity in structured format for WhatsUpMTL."

  parameter :name, description: "Name of the activity"
  parameter :description, description: "Description of the activity"
  parameter :url, description: "URL of the activity"
  parameter :location, description: "Location of the activity"
  parameter :price, description: "Price of the activity"
  parameter :img, description: "Image URL of the activity"
  parameter :starts_at, description: "Start date and time"
  parameter :ends_at, description: "End date and time"

  def execute(name:, description:, url:, location:, price:, img:, starts_at:, ends_at:)
    {
      name: name,
      description: description,
      url: url,
      location: location,
      price: price,
      img: img,
      starts_at: starts_at,
      ends_at: ends_at
    }
  end
end

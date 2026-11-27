class CreateActivityTool < RubyLLM::Tool
  description "Returns an activity in structured format for WhatsUpMTL."

  parameter :name, description: "Name of the activity", required: true
  parameter :short_description, description: "Short description of the activity, limit to one sentence", required: true
  parameter :description, description: "Description of the activity", required: true
  parameter :url, description: "URL of the activity", required: true
  parameter :location, description: "Location of the activity", required: true
  parameter :price, description: "Price of the activity", required: true
  parameter :img, description: "Image URL of the activity",
  parameter :starts_at, description: "Start date and time", required: true
  parameter :ends_at, description: "End date and time", required: true

  def execute(name:, short_description:, description:, url:, location:, price:, img:, starts_at:, ends_at:)
    {
      name: name,
      short_description: short_description,
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

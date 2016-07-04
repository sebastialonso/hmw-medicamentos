object => false
attribute :name
glue :full_name => 'qwerty' do |med|
  med.prices.minimum(:value)
end
node @pharmacy => 'farmacia' do
  attribute :name
end
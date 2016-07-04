object false
child @med => 'medicamento' do
  attribute :name
  node :precio do
    @med.prices.minimum(:value)
  end
  node :farmacia do
    @pharmacy.name
  end
end
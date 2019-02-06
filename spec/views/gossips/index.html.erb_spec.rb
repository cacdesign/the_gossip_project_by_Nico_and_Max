require 'rails_helper'

RSpec.describe "gossips/index", type: :view do

  context 'some context' do  
    it 'should display something' do
      render
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Gossips'    end
  end


  context 'other context' do  
    it 'should display something' do
      # vérifier que tous les potins sont affichés 

      # déclare la variable cities, qui est une array contenant des villes
    assign(:gossips,
    [
      build(:gossip, title: "Michel"),
      build(:gossip, content: "Aime les quenelles"),
      build(:gossip),
      build(:gossip)
    ]
  )

  render

  # vérifie que le titre d'un potin  soit affiché
  expect(rendered).to match /Michel/

  # vérifie que le contenu d'un potin soit affiché
  expect(rendered).to match /Aime les quenelles/


    end
  end

end
require 'rails_helper'

RSpec.describe 'Reservation  Page', type: :system do
    it 'reservation' do
        visit '/'

        first(:css, '.movie-card').click
        first(:css, 'input[type=radio]').click
        first(:css, 'input[type=submit]').click

        expect(page).to have_content('Información Reserva')
        expect(page).to have_content('Seleccionar Asientos')
        expect(page).to have_content('Nombre Película')
        expect(page).to have_content('Fecha Función')
        expect(page).to have_content('Horario')
    end

    it 'create reservation' do
      visit '/'

      first(:css, '.movie-card').click
      first(:css, 'input[type=radio]').click
      select '3', :from => "seats"
      first(:css, 'input[type=submit]').click

      fill_in 'name', :with => 'Pelicula'
  
      first(:css, '.box', wait: 10).click
      first(:css, 'input[type=submit]').click

      expect(page).to have_content('Películas')
      expect(page).to have_content("Reservation was successfully created.")
  end
end
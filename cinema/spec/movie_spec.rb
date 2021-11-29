require 'rails_helper'

RSpec.describe 'Movie page', type: :system do
    it 'index' do
        visit '/'

        first(:css, '.movie-card').click
        expect(page).to have_content('Name')
        expect(page).to have_content('Fecha')
        expect(page).to have_content('Reserva')
        expect(page).to have_content('Matine')
        expect(page).to have_content('Tanda')
        expect(page).to have_content('Noche')
    end

    it 'create' do
        visit '/'
        first(:css, '.add-movie-btn').click

        fill_in 'name', :with => 'Persona'
        fill_in 'img', :with => 'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png'
        fill_in 'first_day', :with => "2021-11-28"
        fill_in 'last_day', :with => "2021-11-29"

        check('matine_sala1')

        first(:css, 'input[type=submit]').click

        expect(page).to have_content('Películas')
        expect(page).to have_content("Movie was successfully created.")
    end
end
require 'rails_helper'

RSpec.feature 'Items', type: :feature do
  describe 'New Item button' do
    before do
      visit items_path
      click_link 'New Item'
    end

    subject { page }

    its(:current_path) { should eq(new_item_path) }
  end

  describe '新規にItemを生成' do
    before do
      visit new_item_path

      fill_in 'Name',  with: 'name1'
      fill_in 'Price', with: '100'

      click_button 'Create Item'
    end

    subject{ page }

    it 'Itemが生成されること' do
      expect(subject.current_path).to eq(item_path(1))
      expect(subject).to have_text('Item was successfully created.')
      expect(Item.all.size).to eq(1)

      item = Item.all.first
      expect(item.name).to eq('name1')
      expect(item.price).to eq(100)
    end
  end

  describe 'add photo ボタンを押す', js: true do
    before do
      visit new_item_path
      click_link 'add photo'
    end

    subject{ page }

    it { expect(subject).to have_text('Title') }
  end

  describe 'add photo ボタンを押して、写真をデータを追加する', js: true do
    before do
      visit new_item_path

      fill_in 'Name',  with: 'name1'
      fill_in 'Price', with: '100'

      click_link 'add photo'
      click_link 'add photo'

      find('div#photos div.nested-fields:nth-of-type(1) input[name*=title]').set('title1')
      find('div#photos div.nested-fields:nth-of-type(2) input[name*=title]').set('title2')

      click_button 'Create Item'
    end

    subject{ page }

    it '写真データが2個紐付いていること' do
      expect(subject.current_path).to eq(item_path(1))
      expect(subject).to have_text('Item was successfully created.')
      expect(Item.all.size).to eq(1)

      item = Item.all.first
      expect(item.photos.size).to eq(2)
      expect(item.photos[0].title).to eq('title1')
      expect(item.photos[1].title).to eq('title2')
    end
  end
end

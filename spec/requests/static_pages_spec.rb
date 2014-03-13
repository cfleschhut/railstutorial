require 'spec_helper'

describe 'StaticPages' do

  subject { page }

  describe 'Home page' do
    before { visit root_path }

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }
    it { should have_content('Welcome') }

    describe 'for signed-in users' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: 'Lorem ipsum')
        FactoryGirl.create(:micropost, user: user, content: 'Dolor sit amet')
        sign_in user
        visit root_path
      end

      it 'should render the user’s feed' do
        user.feed.each do |item|
          page.should have_selector("#micropost-item-#{item.id}", text: item.content)
        end
      end
    end
  end

  describe 'Help page' do
    before { visit help_path }

    it { should have_selector('title', text: full_title('Help')) }
    it { should have_selector('h1', text: 'Help') }
  end

  describe 'About page' do
    before { visit about_path }

    it { should have_selector('title', text: full_title('About')) }
    it { should have_selector('h1', text: 'About') }
  end

  describe 'Contact page' do
    before { visit contact_path }

    it { should have_selector('title', text: full_title('Contact')) }
    it { should have_selector('h1', text: 'Contact') }
  end

end
